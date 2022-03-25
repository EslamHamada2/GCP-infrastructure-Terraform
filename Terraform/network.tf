module "network_module" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  router_name = var.router_name
  nat_name    = var.nat_name
}