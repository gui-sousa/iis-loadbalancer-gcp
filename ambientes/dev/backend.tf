terraform {
  backend "gcs" {
    bucket      = "bkt-iis-loadbalancer-dev"
    prefix      = "dev"
    credentials = file("gcp-dev.json")
  }
}