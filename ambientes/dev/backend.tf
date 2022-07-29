terraform {
  backend "gcs" {
    bucket      = "bkt-iis-loadbalancer-dev-2"
    prefix      = "dev"
    credentials = file("tf-gcp-dev.json")
  }
}