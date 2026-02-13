module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2" {
  source = "./modules/ec2"

  project_name        = var.project_name
  environment         = var.environment
  instance_type       = var.ec2_instance_type
  key_name            = var.ec2_key_name
  subnet_id           = module.network.public_subnet_ids[0]
  vpc_id              = module.network.vpc_id
  ami_id              = data.aws_ami.al2023.id
  associate_public_ip = var.associate_public_ip
}

module "s3" {
  source = "./modules/s3"

  project_name  = var.project_name
  environment   = var.environment
  region        = var.region
  versioning    = var.s3_versioning
  force_destroy = var.s3_force_destroy
}
