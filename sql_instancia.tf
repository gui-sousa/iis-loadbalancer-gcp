resource "google_compute_instance" "instancia-sql-1" {
  name         = "bookshelf-sql1"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = var.imagem-core

      #"windows-sql-cloud/sql-2019-standard-windows-2022-dc-v20220418"
    }
  }

  #Define Configuração de Rede
  network_interface {
    network    = google_compute_network.sql.name
    subnetwork = google_compute_subnetwork.sql1.name
    network_ip = var.ip-sql1
    access_config {}
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  depends_on = [
    google_compute_network.sql,
    google_compute_subnetwork.sql1,
    google_compute_subnetwork.sql2
  ]
}

resource "google_compute_instance" "instancia-sql-2" {
  name         = "bookshelf-sql2"
  machine_type = var.tipo-vm
  zone         = var.zona
  boot_disk {
    initialize_params {
      image = var.imagem-core
    }
  }

  #Define Configuração de Rede
  network_interface {
    network    = google_compute_network.sql.name
    subnetwork = google_compute_subnetwork.sql2.name
    network_ip = var.ip-sql2
    access_config {}
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  depends_on = [
    google_compute_network.sql,
    google_compute_subnetwork.sql1,
    google_compute_subnetwork.sql2
  ]
}