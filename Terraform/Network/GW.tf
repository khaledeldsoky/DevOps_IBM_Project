resource "ibm_is_vpc_routing_table" "khaled" {
  name = "khaled-routing-table"
  vpc  = var.vpc_id
}

resource "ibm_is_public_gateway" "gateway" {
  for_each = var.GW
  name = each.key
  vpc  = var.vpc_id
  zone = each.value.zone
}
