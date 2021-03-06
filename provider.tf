terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.27.0"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
  zone = var.zone
  credentials = var.credentials
}