output "IP_AD" {
  value = google_compute_instance.instancia-ad.network_interface.0.access_config.0.nat_ip
}

output "IP_IIS" {
  value = google_compute_instance.instancia-iis.network_interface.0.access_config.0.nat_ip
}

output "IP_SQL1" {
  value = google_compute_instance.instancia-sql-1.network_interface.0.access_config.0.nat_ip
}

output "IP_SQL2" {
  value = google_compute_instance.instancia-sql-2.network_interface.0.access_config.0.nat_ip
}