module "vpc" {
  count       = var.deploy_vpc
  source      = "./modules/vpc"
  instance_id = var.enable_ec2 == 1 ? module.ec2[0].instance_id : ""
  enable_ec2  = var.enable_ec2
  tags        = var.tags
}

module "security_groups" {
  count  = var.enable_security_groups
  source = "./modules/security-groups"
  vpc_id = var.deploy_vpc == 1 ? module.vpc[0].vpc_id : null
  tags   = var.tags
}

module "ec2" {
  count             = terraform.workspace == "default" ? 2 : var.enable_ec2
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  subnet_id         = module.vpc[0].subnet_id
  sg_id             = module.security_groups[0].vpc_gp_id
  ec2_instance_type = var.ec2_instance_type
  index             = count.index
  tags              = var.tags
}

