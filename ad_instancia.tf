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
    network = "default"
    access_config {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}