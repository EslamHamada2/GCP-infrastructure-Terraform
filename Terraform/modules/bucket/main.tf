resource "google_storage_bucket" "buckets" {
  count         = length(var.bucket_name)
  name          = var.bucket_name[count.index]
  location      = var.bucket_location
  force_destroy = true
  storage_class = var.bucket_class 
}
