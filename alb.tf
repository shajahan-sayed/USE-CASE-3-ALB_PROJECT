#creating application load balancer
resource "aws_lb" "alb_uc3" {
 name = "alb_uc3"
 load_balancer_type = "application"
 security_groups = [aws_security_group.alb_security_group.id]

 subnets = [aws_subnet.subnet_1.id,
            aws_subnet.subnet_2.id,
            aws_subnet.subnet_3.id]

 tags = {
   Name = "alb_uc3"
 }
}

#creating target group
resource "aws_target_group" "tg_home" {
 name = "tg_home"
 port = 80
 protocol = "HTTP"
 vpc_id = aws_vpc.vpc_alb.id

 tags = {
  Name = "tg_home"
 }
}

resource "aws_target_group" "tg_image" {
 Name = "tg_image"
 port = 80
 protocol = "HTTP"
 vpc_id = aws_vpc.vpc_alb.id

 tags = {
  Name = "tg_image"
 }
}
resource "aws_target_group" "tg_register" {
 name = "tg_register"
 port = 80
 protocol = "HTTP"
 vpc_id = aws_vpc.vpc_alb.id

 tags = {
  Name = "tg_register"
 }
}

#attaching ec2 to target group 
resource "aws_target_group_attachment" "home" {
 target_group_arn = aws_target_group.tg_home.arn
 target_id = aws_instance.web_page1.id
 port = 80
}
resource "aws_target_group_attachment" image" {
 target_group_arn = aws_target_group.tg_image.arn
 target_id = aws_instance.web_page2.id
}
resource "aws_target_group_attachment" "register" {
 target_group_arn = aws_target_group.tg_register.arn
 target_id = aws_instance.web_page3.id
}

#creating listerners
resource "aws_lb_listener_rule" "http_listener" {
 load_balancer_arn = aws_lb.alb_uc3.arn
 port = 80
 protocol = "HTTP"

   default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Invalid Path"
      status_code  = "404"
    }
  }
}

#listener rules for path based routing 
resource "aws_lb_listener_rule" "home_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 10

  condition {
    path_pattern {
      values = ["/"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_home.arn
  }
}

resource "aws_lb_listener_rule" "images_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 20

  condition {
    path_pattern {
      values = ["/images*"]  # Correct format for subpath routing
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_images.arn
  }
}

resource "aws_lb_listener_rule" "register_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 30

  condition {
    path_pattern {
      values = ["/register*"]  # Correct format for subpath routing
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_register.arn
  }
}


 
