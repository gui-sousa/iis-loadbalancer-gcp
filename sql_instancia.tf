resource "google_compute_instance" "server" {
  for_each = var.server

  name         = each.key
  machine_type = each.value["machine_type"]
  zone         = each.value["zone"]
  boot_disk {
    initialize_params {
      image = "sql-2016-enterprise-windows-2019-dc-v20220415"
    }
  }

  #Define Configuração de Rede
  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}