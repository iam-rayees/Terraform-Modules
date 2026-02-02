module "prod_vpc_1" {
  source              = "../modules/network"
  vpc_cidr            = "192.168.0.0/16"
  vpc_name            = "prod_vpc_1"
  environment         = "production"
  public_subnet_cidr  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_subnet_cidr = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
  az_name             = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "prod_nat" {
  source                 = "../modules/nat"
  public_subnet_id       = module.prod_vpc_1.public-subnet[0]
  private_route_table_id = module.prod_vpc_1.private_route_table_id
}

data "aws_acm_certificate" "cert" {
  domain      = "*.cloudrayeez.xyz"
  types       = ["AMAZON_ISSUED"]
  statuses    = ["ISSUED"]
  most_recent = true
}

module "prod_elb" {
  source          = "../modules/elb"
  environment     = "production"
  vpc_id          = module.prod_vpc_1.vpc_id
  subnets         = module.prod_vpc_1.public-subnet
  security_groups = [module.prod_sg_1.sg_id]
  instance_ids    = concat(module.prod_ec2_1.public_instance_ids, module.prod_ec2_1.private_instance_ids)
  certificate_arn = data.aws_acm_certificate.cert.arn
}

data "aws_route53_zone" "main" {
  name = "cloudrayeez.xyz"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.cloudrayeez.xyz"
  type    = "A"

  alias {
    name                   = module.prod_elb.alb_dns_name
    zone_id                = module.prod_elb.alb_zone_id
    evaluate_target_health = true
  }
}
