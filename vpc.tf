#creating vpc 
resource "aws_vpc" "vpc_alb" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "vpc_alb"
  }
}

  #creating subnet1
  resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.vpc_alb
    cidr_block = var.subnet1_cidr_block

    tags = {
      Name = "subnet_1"
    }
  }
  resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.vpc_alb
    cidr_block = var.subnet2_cidr_block

    tags = {
      Name = "subnet_2"
    }
  }
    resource "aws_subnet" "subnet_3" {
    vpc_id = aws_vpc.vpc_alb
    cidr_block = var.subnet3_cidr_block

    tags = {
      Name = "subnet_3"
    }
    }
  #creating internet gate way
  resource "aws_internet_gateway" "alb_igw" {
    vpc_id = aws_vpc.vpc_alb.id

    tags = {
      Name = "alb_igw"
    }
  }

#creating route table
  resource "aws_route_table" "alb_route_table" {
    vpc_id = aws_vpc.vpc_alb.id

    tags = {
      Name = "alb_route_table"
    }
  }

  #creating route to attach internet gateway

  resource "aws_route" "alb_route" {
    gateway_id = aws_internet_gateway.alb_igw.id
    destination_cidr_block = "0.0.0.0/0"
    route_table_id = aws_route_table.alb_route_table.id
  }

 #associate public subnet with route table
   resource "aws_route_table_association" "subnet1_asso" {
     subnet_id = aws_subnet.subnet_1.id
     route_table_id = aws_route_table.alb_route_table.id
   }

   resource "aws_route_table_association" "subnet2_asso" {
     subnet_id = aws_subnet.subnet_2.id
     route_table_id = aws_route_table.alb_route_table.id
   }
    resource "aws_route_table_association" "subnet3_asso" {
     subnet_id = aws_subnet.subnet_3.id
     route_table_id = aws_route_table.alb_route_table.id
   }
  

    
    
