variable "bucket_name" {
    type    = list
    default = ["randombucketname0","randombucketname1","randombucketname2"]
}

variable "bucket_location" {
    type = string
}

variable "bucket_class" {
    type    = string
    default = "STANDARD"
}
