data "template_file" "host-ansible" {
  template = file("./playbooks/hosts-template.txt")
  vars = {
    ip_instancia_ad   = google_compute_instance.instancia-ad.network_interface.0.access_config.0.nat_ip
    ip_instancia_iis  = google_compute_instance.instancia-iis.network_interface.0.access_config.0.nat_ip
    ip_instancia_sql1 = google_compute_instance.instancia-sql-1.network_interface.0.access_config.0.nat_ip
    ip_instancia_sql2 = google_compute_instance.instancia-sql-2.network_interface.0.access_config.0.nat_ip
  }
}

data "template_file" "playbook-ansible" {
  template = file("./playbooks/playbook-ad-template.yml")
  vars = {
    "ip_instancia_ad" = google_compute_instance.instancia-ad.network_interface.0.access_config.0.nat_ip
  }


}

resource "local_file" "host" {
  filename = "./hosts.ini"
  content  = data.template_file.host-ansible.rendered
}

resource "local_file" "playbook" {
  filename = "./playbook.yml"
  content  = data.template_file.playbook-ansible.rendered
}