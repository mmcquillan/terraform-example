variable "sleep_seconds" {
  default = 30
}

resource "null_resource" "sleepy" {
  triggers {
    always_trigger = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "/bin/bash -c \"trap -p SIGINT; echo 'Sleeping for ${var.sleep_seconds} seconds...'; sleep ${var.sleep_seconds}; echo '...done'\""
  }
}
