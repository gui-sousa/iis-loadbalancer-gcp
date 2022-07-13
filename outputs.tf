output "IP_IIS" {
  value = google_compute_instance.instancia-iis.network_interface.0.access_config.0.nat_ip
}

output "NOME_REDE" {
  value = google_compute_subnetwork.sql1.network
}