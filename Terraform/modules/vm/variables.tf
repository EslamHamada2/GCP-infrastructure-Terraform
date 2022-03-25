variable "vm_name" {
    type = string
}

variable "vm_type" {
    type    = string
    default = "e2-micro"
}

variable "zone" {
    type = string
    default = "us-central1-c"
}

variable "vpc_id" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "image" {
    type    = string
    default = "debian-cloud/debian-9"
}
