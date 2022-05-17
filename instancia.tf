resource "google_compute_instance" "instancia-iis" {
  name         = "iis-lab-test1"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = "windows-server-20h2-dc-core-v20220414"
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
