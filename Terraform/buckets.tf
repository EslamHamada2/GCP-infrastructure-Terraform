module "bucket_module" {
  source          = "./modules/bucket"
  bucket_name     = var.bucket_name
  bucket_location = var.bucket_location
  bucket_class    = var.bucket_class
}