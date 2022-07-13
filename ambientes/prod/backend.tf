terraform {
  backend "gcs" {
    bucket      = "bkt-iis-loadbalancer-produ"
    prefix      = "prod"
    credentials = file("gcp-prod.json")
  }
}