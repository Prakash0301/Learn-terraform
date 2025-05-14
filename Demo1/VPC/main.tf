resource "aws_vpc" "vpc_main" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = var.aws_subnet1
  availability_zone = var.availability_zone-a
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = var.aws_subnet2
    availability_zone = var.availability_zone-b
    map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id     = "${aws_vpc.vpc_main.id}"
  cidr_block = var.aws_subnet3
    availability_zone = var.availability_zone-c  
    map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-3"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc_main.id}"

  tags = {
    Name = "MyInternetGateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "MyPublicRouteTable"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
   
  }
  tags = {
    Name = "MyPrivateRouteTable"
  }
}

# Associate subnets with public route table
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public.id
}

# Associate subnet with private route table
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "ec2_security_group" {
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.vpc_main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_security_group"
  }
}