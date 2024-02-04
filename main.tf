provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "./VPC"
}
module "aws_instance_1" {
  source                      = "./EC2"
  ami                         = "ami-0c7217cdde317cfec"
  subnet_id                   = module.vpc.pub_sub1
  vpc_security_group_ids      = [module.vpc.webSg]
  associate_public_ip_address = true

}
module "aws_instance_2" {
  source                      = "./EC2"
  ami                         = "ami-0c7217cdde317cfec"
  subnet_id                   = module.vpc.pvt_sub1
  vpc_security_group_ids      = [module.vpc.webSg]
  associate_public_ip_address = false

}

# module "alb" {
#   source                 = "./ALB"
#   vpc_security_group_ids = [module.vpc.webSg]
#   subnet1_id             = module.vpc.pub_sub1
#   subnet2_id             = module.vpc.pub_sub2
#   vpc_id                 = module.vpc.vpc_id
#   target1_id   = module.aws_instance_1.instance_id
#   target2_id   = module.aws_instance_2.instance_id

# }