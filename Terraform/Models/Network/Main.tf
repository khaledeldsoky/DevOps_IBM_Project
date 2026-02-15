resource "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "ibm_is_vpc" "vpc" {
  for_each = var.vpc
  name           = each.key
  resource_group = each.value.vpc_resource_group_id
  tags = ["Name:${each.key}"]
}


resource "ibm_is_vpc_address_prefix" "address_prefix" {
  for_each = var.address_prefix
  name = each.value.name
  zone = each.value.zone
  vpc  = var.vpc_id
  cidr = each.value.cidr
}


resource "ibm_is_vpc_routing_table" "vpc_routing_table" {
  name = "khaled-routing-table"
  vpc  = var.vpc_id
}


resource "ibm_is_public_gateway" "public_gateway" {
  for_each = var.public_gateway
  name = each.key
  vpc  = var.vpc_id
  zone = each.value.zone
}


resource "ibm_is_subnet" "subnet" {

  for_each = var.subnet

  zone            = each.value.subnet_zone
  name            = each.key
  vpc             = each.value.subent_vpc_id
  ipv4_cidr_block = each.value.subnet_cider_block
  routing_table   = ibm_is_vpc_routing_table.vpc_routing_table.routing_table
  public_gateway  = each.value.public_gateway
  tags            = ["Name:subnet_${each.key}"]
  
  depends_on = [
    ibm_is_vpc_address_prefix.address_prefix
  ]
  
}


resource "ibm_is_floating_ip" "floating_ip" {
  for_each = var.floating_ip

  name   = each.key
  target = each.value.primary_network_interface_id # == ibm_is_instance.master_instance.primary_network_interface[0].id
  tags = ["Name:F_ip_${each.key}"]
}


