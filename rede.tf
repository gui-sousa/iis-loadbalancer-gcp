resource "google_compute_network" "sql" {
  name = "iis-net-sql"
}

resource "google_compute_subnetwork" "sql1" {
  name          = "private-sql-1"
  ip_cidr_range = "10.3.0.0/24"
  region        = var.regiao
  network       = google_compute_network.sql.id
}

resource "google_compute_subnetwork" "sql2" {
  name          = "private-sql-2"
  ip_cidr_range = "10.4.0.0/24"
  region        = var.regiao
  network       = google_compute_network.sql.id
}

resource "google_compute_firewall" "tcp-rule" {
  name    = "iis-tcp-rule"
  network = google_compute_network.sql.id
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  source_ranges = ["10.4.0.0/24", "10.3.0.0/24"]
}