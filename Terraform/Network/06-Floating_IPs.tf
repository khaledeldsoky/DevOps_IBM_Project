resource "ibm_is_floating_ip" "F_ip" {
  for_each = var.F_ip

  name   = each.key
  target = each.value.primary_network_interface_id # == ibm_is_instance.master_instance.primary_network_interface[0].id
  tags = ["Name:F_ip_${each.key}"]
}
