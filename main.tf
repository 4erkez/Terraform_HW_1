resource "google_storage_bucket" "homework-18" {
  name          = var.storage_name
  location      = var.location
  force_destroy = true
  
  uniform_bucket_level_access = true
}

resource "google_compute_instance" "homework-18" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone
  
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }
  network_interface {
    network = var.network

    access_config {
      // Ephemeral public IP
    
}
    }
    metadata_startup_script = "sudo apt-get -y update; sudo apt-get -y install nginx; sudo service nginx start;"
  
}

output "vm_ip_v4_external" {
  value = google_compute_instance.homework-18.network_interface.0.access_config[0].nat_ip
}

output "gcp_bucket_url" {
  value = google_storage_bucket.homework-18.url
}