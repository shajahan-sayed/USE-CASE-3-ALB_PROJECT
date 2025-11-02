variable "aws_region" {
  description = "aws region to deply"
  type = string 
  deafult = "ap-south-1"
}
variable "instance_type" {
  description = "giving instance_type to EC2"
  type = string 
  default = "t2.micro"
}
variable "key_name" {
  description = "attaching key name"
  type = string
  default = "auto1"
}
variable "vpc_cidr_block" {
  description = "attaching vpc cidr block"
  type = string 
}
variable "subnet1_cidr_block" {
  description = "attaching cidr block to subnet"
  type = string
}
variable "subnet2_cidr_block" {
  description = "attaching cidr block to subnet"
  type = string
}
variable "subnet3_cidr_block" {
  description = "attaching cidr block to subnet"
  type = string
}

