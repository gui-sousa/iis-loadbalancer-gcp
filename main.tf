provider "google" {
  credentials = file(var.credenciais)
  project = var.projeto
  region  = var.regiao
}



