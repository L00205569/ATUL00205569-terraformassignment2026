module "network" {
  source = "./modules/network"

  region      = var.region
  environment = var.environment
  owner       = var.owner
}

module "compute" {
  source = "./modules/compute"

  region         = var.region
  environment    = var.environment
  instance_type  = var.instance_type
  subnet_id      = module.network.subnet_id
  vpc_id         = module.network.vpc_id
  ssh_cidr       = var.ssh_cidr
  require_imdsv2 = var.require_imdsv2
  owner          = var.owner
}

module "storage" {
  source = "./modules/storage"

  bucket_name              = "${lower(var.owner)}-logs-${var.environment}"
  kms_key_arn              = module.compute.kms_key_arn
  s3_encryption_enabled    = var.s3_encryption_enabled
  s3_public_access_blocked = var.s3_public_access_blocked
  owner                    = var.owner
}
