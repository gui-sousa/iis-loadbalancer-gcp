variable "regiao" {
  default = "us-central1"
}

variable "projeto" {
}

variable "credenciais" {
}

variable "tipo-vm" {
  default = "n2-highcpu-4"
}

variable "zona" {
  default = "us-central1-a"
}

variable "server" {
  type = map(object({
    name         = string
    machine_type = string
    zone         = string

  }))

  default = {
    "bookshelf-sql1" = {
      machine_type = "n1-highmem-4"
      name         = "bookshelf-sql1"
      zone         = "us-central1-a"
    },

    "bookshelf-sql2" = {
      machine_type = "n1-highmem-4"
      name         = "bookshelf-sql2"
      zone         = "us-central1-a"
    }
  }
}