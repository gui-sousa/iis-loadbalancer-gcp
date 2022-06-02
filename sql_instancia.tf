resource "google_compute_instance" "instancia-sql" {
  for_each = var.server

  name         = each.key
  machine_type = each.value["machine_type"]
  zone         = each.value["zone"]
  boot_disk {
    initialize_params {
      image = "windows-sql-cloud/sql-2019-standard-windows-2022-dc-v20220418"
    }
  }

  #Define Configuração de Rede
  network_interface {
    subnetwork = each.value["subnet"]
    network_ip = each.value["ip"]
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  depends_on = [
    google_compute_subnetwork.sql1,
    google_compute_subnetwork.sql2
  ]
}