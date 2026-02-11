resource "ibm_is_security_group" "SG" {

  for_each = var.SG
  name     = each.key
  vpc      = each.value.vpc_id
  tags = ["Name:SG_${each.key}"]
}


