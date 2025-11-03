#creating security group for ec2 
resource "aws_security_group" "alb_security" {
 description = "Allowing HTTP and SSH"
 vpc_id = aws_vpc.vpc_alb.id

 ingress {
  description = "allowing http port"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0]
 }
 ingress { 
  description = "allowing SSH port"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
 from_port = 0
 to_port = 0
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
   Name = "alb_security"
 }
}

#creating security for load balancer
 resource "aws_security_group" "alb_security_group" {
  description = "Allowing SSH and HTTP"
  vpc_id = aws_vpc.vpc_alb.id

  ingress {
   description = "allowing http port"
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
   description = "allowing SSH port"
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "alb_security_group"
  }
}
