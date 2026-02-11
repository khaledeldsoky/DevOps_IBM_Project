resource "ibm_is_instance" "instance" {
  for_each = var.instance

  vpc            = each.value.instance_vpc_id
  name           = each.key
  profile        = each.value.instance_profile
  image          = each.value.image
  zone           = each.value.instance_zone
  resource_group = each.value.instance_resource_group
  keys           = [each.value.instance_keys]

  primary_network_interface {
    subnet          = each.value.instance_subnet_id
    security_groups = [each.value.instance_security_groups_id]
  }

tags = ["Name:instance_${each.key}"]
}
