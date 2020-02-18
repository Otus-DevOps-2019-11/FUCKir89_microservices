provider "google" {
  version = "~> 2.15.0"
  project = var.project
  region  = var.region
}
resource "google_compute_instance" "appdocker" {
  name            = "${var.app_name}${count.index}"
  count           = var.instances_count
  machine_type    = "g1-small"
  zone            = var.zone
  tags            = ["appdocker"]
  boot_disk {
    initialize_params { image = var.app_disk_image }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.appdockerip.address
    }
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].access_config[0].nat_ip
    user        = "appuser"
    agent       = false
    private_key = file(var.privat_key_path)
  }

  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}
resource "google_compute_address" "appdockerip" {
  name = "app-dicker-ip"
}

resource "google_compute_firewall" "firewallpuma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["appdocker"]
}
