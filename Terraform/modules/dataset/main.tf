resource "google_bigquery_dataset" "datasets" {
  count         = length(var.dataset_id)
  dataset_id    = var.dataset_id[count.index]
  location      = var.dataset_location
}
