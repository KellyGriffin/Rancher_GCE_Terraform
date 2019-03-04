variable "username" {
  description = "Your username used for SSH"
  default     = "<modify>"
}
variable "region" {
  description = "Region of GCE resources"
  default     = "us-central1"
}

variable "region_zone" {
  description = "Region and Zone of GCE resources"
  default     = "us-central1-a"
}

variable "project" {
	 description = "Name of GCE project"
   default     = "<modify>"
}

variable "machine_type" {
	description = "Type of VM to be created"
	default 		= "n1-standard-4"
}
variable "image" {
	description = "Name of the OS image for compute instances"
	default		  = "ubuntu-os-cloud/ubuntu-1804-bionic-v20190212a"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials - service account"
  default     = "<modify>"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "<modify>"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "<modify>"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/provision-rancher-server.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/provision-rancher-server.sh"
}