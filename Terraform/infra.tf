module "network_module" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  router_name = var.router_name
  nat_name    = var.nat_name
}

module "vm_module" {
  source    = "./modules/vm"
  vm_name   = var.vm_name
  vm_type   = var.vm_type
  zone      = var.zone
  vpc_id    = module.network_module.vpc_output
  subnet_id = module.network_module.subnet_output
  image     = var.image
}

module "gke_module" {
  source           = "./modules/gke"
  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
  vpc_id           = module.network_module.vpc_output
  subnet_id        = module.network_module.subnet_output
  master_cidr      = var.master_cidr
  machine_type     = var.machine_type
  node_count       = var.node_count
}

module "bucket_module" {
  source          = "./modules/bucket"
  bucket_name     = var.bucket_name
  bucket_location = var.bucket_location
  bucket_class    = var.bucket_class
}

module "dataset_module" {
  source           = "./modules/dataset"
  dataset_id       = var.dataset_id
  dataset_location = var.dataset_location
}