module "prod_ec2_1" {
  source      = "../modules/compute"
  environment = module.prod_vpc_1.environment
  key_name    = "Linux_secfile"
  aws_region  = var.aws_region
  amis = {
    us-east-1 = "ami-0b6c6ebed2801a5cb"
    us-east-2 = "ami-06e3c045d79fd65d9"
  }
  vpc_name       = module.prod_vpc_1.vpc_name
  public-subnet  = module.prod_vpc_1.public-subnet
  sg_id          = module.prod_sg_1.sg_id
  private-subnet = module.prod_vpc_1.private-subnet

}
