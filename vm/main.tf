# Example to create a DigitalOcean VM

variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "default" {
  name       = "HashiMatt-Laptop"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "digitalocean_droplet" "example" {
  image     = "ubuntu-18-04-x64"
  name      = "example"
  region    = "nyc3"
  size      = "s-1vcpu-1gb"
  ssh_keys  = ["${digitalocean_ssh_key.default.fingerprint}"]
  user_data = "./init.sh"
}

output "address" {
  value = "${digitalocean_droplet.example.ipv4_address}"
}
