provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}


module "storage-bucket-prod" {
  source   = "SweetOps/storage-bucket/google"
  version  = "0.3.0"
  name     = "storage-bucket-otus-ilya-docker-prod"
  location = "europe-west1"
  #force_destroy = true
}


output storage-bucket_url-prod {
  value = "${module.storage-bucket-prod.url}"
}