output "alb_dns_name" {
 value = aws_lb.alb_uc3.dns_name
}
output "instance_public_ip" {
 value = [
          aws_instance.web_page1.public_ip,
          aws_instance.web_page2.public_ip,
          aws_instance.web_page3.public_ip
         ]
}
         
