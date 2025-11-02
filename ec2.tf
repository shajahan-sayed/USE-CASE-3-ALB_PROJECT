resource "aws_instance" "web_page1" {
  ami  = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.alb_security.id]

  tags = {
   Name = "web_page1"
  }
}

resource "aws_instance" "web_page2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.alb_security.id]

  tags = {
    Name = "web_page2"
  }
}

resource "aws_instance" "web_page2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.alb_security.id]

  tags = {
    Name = "web_page2"
  }
}

