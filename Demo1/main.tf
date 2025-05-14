module "vpc" {
  source = "./vpc"
  # All default values are used from vpc/variables.tf
}

module "ec2" {
  source            = "./ec2"
  ami_id            = "ami-062f0cc54dbfd8ef1" # Or pass from tfvars
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.ec2_sg_id
}
