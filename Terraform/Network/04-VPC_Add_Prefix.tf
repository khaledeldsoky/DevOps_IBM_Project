resource "ibm_is_vpc_address_prefix" "khaled" {
  for_each = var.address_prefix
  name = each.value.name
  zone = each.value.zone
  vpc  = var.vpc_id
  cidr = each.value.cidr
}
