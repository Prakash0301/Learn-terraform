
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  
}

variable "aws_subnet1" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
  
}

variable "aws_subnet2" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.2.0/24"
  
}

variable "aws_subnet3" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.3.0/24"
  
}

variable "availability_zone-a" {
  description = "The availability zone for the Subnet"
  type        = string
  default     = "ap-south-1a"
  
}
variable "availability_zone-b" {
  description = "The availability zone for the Subnet"
  type        = string
  default     = "ap-south-1b"
  
}
variable "availability_zone-c" {
  description = "The availability zone for the Subnet"
  type        = string
  default     = "ap-south-1c"
  
}
