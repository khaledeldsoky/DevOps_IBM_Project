
resource "ibm_is_ssh_key" "ssh" {
  for_each = var.ssh_key

  name       = each.key
  public_key = file("${each.value.path}")
  type       = each.value.ssh_type
}

resource "ibm_is_security_group" "security_group" {

  for_each = var.security_group
  name     = each.key
  vpc      = each.value.vpc_id
  tags = ["Name:SG_${each.key}"]
}

resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
  for_each  = var.security_group_rule_tcp
  group     = each.value.group
  direction = each.value.direction
  remote    = each.value.remote
  
  protocol = "tcp"
  port_max =  each.value.port_max
  port_min =  each.value.port_min
  depends_on = [ibm_is_security_group.security_group]
}


resource "ibm_is_security_group_rule" "security_group_rule_udp" {
  for_each  = var.security_group_rule_udp
  group     = each.value.group
  direction = each.value.direction
  remote    = each.value.remote
  protocol = "udp"
  port_max = each.value.port_max
  port_min = each.value.port_min
  depends_on = [ibm_is_security_group.security_group]
}

resource "ibm_is_security_group_rule" "security_group_rule_icmp" {
  for_each  = var.security_group_rule_icmp
  group     = each.value.group
  direction = each.value.direction
  remote    = each.value.remote
  protocol =  "icmp"
  depends_on = [ibm_is_security_group.security_group]
}


