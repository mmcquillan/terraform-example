variable "sleep_seconds" {
  default = 60
}

resource "null_resource" "sleepy" {
  triggers {
    always_trigger = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "/bin/bash -c \"echo 'Sleeping for ${var.sleep_seconds} seconds...'; sleep ${var.sleep_seconds}; echo '...done'\""
  }
}

