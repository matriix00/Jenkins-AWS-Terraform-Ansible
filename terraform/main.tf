module "network" {
  
  source = "/home/dev97/Downloads/deploy-jenkins-aws-tft-ansible/terraform/network"

  region = var.region
  subnet_cidrs = var.subnet_cidrs
  vpc_cidrs = var.vpc_cidrs
  az = var.az


}