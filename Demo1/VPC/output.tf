output "vpc_id" {
  value = aws_vpc.vpc_main.id
}

output "subnet_id" {
  value = aws_subnet.public-subnet-1.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_security_group.id
}
