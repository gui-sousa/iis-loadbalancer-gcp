terraform {
  backend "gcs" {
    bucket      = "bkt-iis-loadbalancer"
    prefix      = "dev"
    credentials = "gcp-dev.json"
  }
}

provider "google" {
  credentials = file("gcp-dev.json")
  project     = var.projeto
  region      = var.regiao
}



