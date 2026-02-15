data "ibm_is_image" "image_ubuntu" {
  name = "ibm-ubuntu-22-04-5-minimal-amd64-1"
}


data "ibm_is_floating_ip" "data_master_ip" {
  name = "master-ip"
  depends_on = [
  null_resource.delay
  ]
}