resource "google_compute_instance" "instancia-iis" {
  name         = "bookshelf-iis"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = var.imagem-core

      #"windows-server-20h2-dc-core-v20220414"
    }
  }

  #Define Configuração de Rede
  network_interface {
    subnetwork = google_compute_subnetwork.sql1.name
    network_ip = "10.3.0.9"
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}
