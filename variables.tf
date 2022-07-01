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
    network_ip   = string
  }))

  default = {
    "bookshelf-sql1" = {
      machine_type = "n1-standard-2"
      name         = "bookshelf-sql1"
      zone         = "southamerica-east1-b"
      network_ip   = "10.3.0.2"
    },

    "bookshelf-sql2" = {
      machine_type = "n1-standard-2"
      name         = "bookshelf-sql2"
      zone         = "southamerica-east1-c"
      network_ip   = "10.4.0.2"
    }
  }
}
