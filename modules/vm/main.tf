# define locals
locals {
  vm_name = "${var.gcp_project_id}-${var.compute_engine_name}"
}

resource "google_compute_instance" "default" {
  name         = local.vm_name
  machine_type = var.machine_type
  zone         = var.gcp_zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

}