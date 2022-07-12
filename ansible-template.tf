data "template_file" "host-ansible" {
  template = file("./hosts-template.txt")
  vars = {
    ip_instancia = google_compute_instance.instancia-ad.network_interface.0.access_config.0.nat_ip
  }
}

data "template_file" "playbook-ansible" {
  template = file("./playbook-template.yml")
  vars = {
    "ip_instancia" = google_compute_instance.instancia-ad.network_interface.0.access_config.0.nat_ip
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