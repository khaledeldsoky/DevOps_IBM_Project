resource "ibm_is_subnet" "subnet" {

  for_each = var.subnet

  zone            = each.value.subnet_zone
  name            = each.key
  vpc             = each.value.subent_vpc_id
  ipv4_cidr_block = each.value.subnet_cider_block
  routing_table   = ibm_is_vpc_routing_table.khaled.routing_table
  public_gateway  = each.value.public_gateway
  tags            = ["Name:subnet_${each.key}"]
  
  depends_on = [
    ibm_is_vpc_address_prefix.khaled
  ]
  
}
