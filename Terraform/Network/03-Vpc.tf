resource "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "ibm_is_vpc" "vpc" {
  for_each = var.vpc
  name           = each.key
  resource_group = each.value.vpc_resource_group_id
  tags = ["Name:${each.key}"]
}

