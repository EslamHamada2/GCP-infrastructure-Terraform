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