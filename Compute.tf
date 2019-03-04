resource "google_compute_instance" "rancher" {
  name = "rancher-server"
  machine_type = "${var.machine_type}" 
  zone         = "${var.region_zone}"
  tags         = ["rancher-node"]
  boot_disk {
    initialize_params {
       image = "${var.image}" // the operative system (and Linux flavour) that your machine will run
       size  = 100
    }
  }
 
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }
  metadata {
    ssh-keys = "${var.username}:${file("${var.public_key_path}")}"
  }
 provisioner "file" {
    source      = "${var.install_script_src_path}"
    destination = "${var.install_script_dest_path}"

    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${file("${var.private_key_path}")}"
    }
  }
  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/provision-rancher-server.sh",
        "/tmp/provision-rancher-server.sh"
      ]
    connection {
      type        = "ssh"
      user        = "${var.username}"
      private_key = "${file("${var.private_key_path}")}"
    }
  }
}
output "Rancher Server IP Address" {
  value = [
    "Rancher server: ${google_compute_instance.rancher.network_interface.0.access_config.0.nat_ip}",
  ]
}