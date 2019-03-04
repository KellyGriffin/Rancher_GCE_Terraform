resource "google_compute_firewall" "default" {
  name    = "rancher-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rancher-node"]
}