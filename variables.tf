variable "regiao" {
  default = "southamerica-east1"
}

variable "projeto" {
}

variable "credenciais" {
}

variable "tipo-vm" {
  default = "n1-standard-2"
}

variable "zona" {
  default = "southamerica-east1-a"
}

variable "server" {
  type = map(object({
    name         = string
    machine_type = string
    zone         = string
  }))

  default = {
    "bookshelf-sql1" = {
      machine_type = "n1-standard-2"
      name         = "bookshelf-sql1"
      zone         = "southamerica-east1-b"
    },

    "bookshelf-sql2" = {
      machine_type = "n1-standard-2"
      name         = "bookshelf-sql2"
      zone         = "southamerica-east1-c"
    }
  }
}

variable "lan" {
  type = map(object({
    subnetwork = string
    network_ip = string
  }))

  default = {
    "lan1" = {
      subnetwork = "google_compute_subnetwork.sql1.name"
      network_ip = "10.3.0.2"
    },

    "lan2" = {
      subnetwork = "google_compute_subnetwork.sql2.name"
      network_ip = "10.4.0.2"
    }
  }
}
