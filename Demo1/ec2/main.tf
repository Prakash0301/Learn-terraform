provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_instance" {
  ami                         = var.ami_id                       
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id              
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "MyInstance"
  }
}
