resource "aws_instance" "web_page1" {
  ami  = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.alb_security.id]

   user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx

              # Create the HTML content for the home page
              echo '<html>
              <head><title>Home</title></head>
              <body>
              <h1>Hello Bala, your Home page is ready</h1>
              </body>
              </html>' > /usr/share/nginx/html/index.html

              # Restart nginx and enable it to start on boot
              sudo systemctl restart nginx
              sudo systemctl enable nginx
  EOF

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

   user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              
              # Create a directory for images page
              sudo mkdir -p /usr/share/nginx/html/images

              # Create the HTML content for the images page
              echo '<html>
              <head><title>Images</title></head>
              <body>
              <h1>Hello Bala, your Images page is ready</h1>
              </body>
              </html>' > /usr/share/nginx/html/images/index.html

              # Restart nginx and enable it to start on boot
              sudo systemctl restart nginx
              sudo systemctl enable nginx
EOF

  tags = {
    Name = "web_page2"
  }
}

resource "aws_instance" "web_page3" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet_3.id
  vpc_security_group_ids = [aws_security_group.alb_security.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              
              # Create a directory for the register page
              sudo mkdir -p /usr/share/nginx/html/register

              # Create the HTML content for the register page
              echo '<html>
              <head><title>Register</title></head>
              <body>
              <h1>Hello Bala, your Register page is ready</h1>
              </body>
              </html>' > /usr/share/nginx/html/register/index.html

              # Restart nginx and enable it to start on boot
              sudo systemctl restart nginx
              sudo systemctl enable nginx
 

  tags = {
    Name = "web_page3"
  }
}

