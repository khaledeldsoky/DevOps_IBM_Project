data "ibm_is_image" "image_ubuntu" {
  name = "ibm-ubuntu-22-04-5-minimal-amd64-1"
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 60"
  }
  depends_on = [
    module.network,
  ]
}

data "ibm_is_floating_ip" "public_ip_master" {
  name = "public-instance-1"
  depends_on = [
  module.compute,
  null_resource.delay
  ]
}