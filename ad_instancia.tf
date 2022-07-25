resource "google_compute_instance" "instancia-ad" {
  name         = "bookshelf-ad"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = var.imagem-ad
    }
  }

  #Define Configuração de Rede
  network_interface {
    subnetwork = google_compute_subnetwork.ad1.name
    network_ip = "10.1.0.100"
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}