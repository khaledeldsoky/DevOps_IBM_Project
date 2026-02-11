# -------- public ip 
# output "ip" {
#   value = data.ibm_is_floating_ip.public_ip_master.address
# }


# output "iamge" {
#   value = data.ibm_is_image.image_ubuntu
# }

output "IPs" {
  value = module.compute.instance["instance-public"].primary_network_interface[0].primary_ipv4_address
}