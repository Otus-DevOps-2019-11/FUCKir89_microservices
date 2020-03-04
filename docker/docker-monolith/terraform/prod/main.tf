terraform {
  required_version = ">=0.12.18"
}

provider "google" {
  version = "~> 2.15.0"
  project = var.project
  region  = var.region
}

module "app" {
  app_name         = var.app_name
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  project          = var.project
  zone             = var.zone
  app_disk_image   = var.app_disk_image
}

resource "template_file" "dynamic_inventory" {
  template = file("dynamic_inventory.yml")
  vars = {
    app_ext_ip = "${module.app.app_external_ip}"
  }
}