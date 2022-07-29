terraform {
  backend "gcs" {
    bucket      = "bkt-iis-loadbalancer-prod-2"
    prefix      = "prod"
    credentials = file("tf-gcp-prod.json")
  }
}