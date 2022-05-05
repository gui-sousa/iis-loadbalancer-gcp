data "template_file" "script-monitora" {
    template = "${file("template.go")}"
    vars = {
      url_instancia = "${google_compute_instance.instancia-teste.network_interface.0.access_config.0.nat_ip}"
    }
}