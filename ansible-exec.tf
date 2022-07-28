resource "time_sleep" "espera_130_segundos" {
  create_duration = "130s"
}

resource "null_resource" "playbook-exec" {
  depends_on = [
    google_compute_instance.instancia-ad,
    local_file.host,
    local_file.playbook-ad,
    local_file.playbook-iis,
    local_file.playbook-sql,
    time_sleep.espera_130_segundos
  ]

  provisioner "local-exec" {
    command = "ansible-playbook -i hosts.ini playbook-ad.yml -vvv && ansible-playbook -i hosts.ini playbook-iis.yml && ansible-playbook -i hosts.ini playbook-sql.yml "
  }
}