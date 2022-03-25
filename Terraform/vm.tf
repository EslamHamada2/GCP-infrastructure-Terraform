module "vm_module" {
  source    = "./modules/vm"
  vm_name   = var.vm_name
  vm_type   = var.vm_type
  zone      = var.zone
  vpc_id    = module.network_module.vpc_output
  subnet_id = module.network_module.subnet_output
  image     = var.image
}