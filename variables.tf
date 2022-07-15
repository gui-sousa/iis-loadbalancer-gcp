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

variable "ip-sql1" {
  default = "10.3.0.2"
}

variable "ip-sql2" {
  default = "10.4.0.2"
}

variable "imagem-ad" {
}

variable "imagem-core" {
}


/*variable "server" {
  type = map(object({
    name         = string
    machine_type = string
    zone         = string
    network      = string
    network_ip   = string
  }))

  default = {
    "bookshelf-sql1" = {
      machine_type = "n1-standard-2"
      name         = "bookshelf-sql1"
      zone         = "southamerica-east1-b"
      network      = "sql1.network"
      network_ip   = "10.3.0.2"
    }

    #  "bookshelf-sql2" = {
    #    machine_type = "n1-standard-2"
    #    name         = "bookshelf-sql2"
    #    zone         = "southamerica-east1-c"
    #    network      = "sql2.network"
    #    network_ip   = "10.4.0.1"
    #  }
  }
}*/
