resource "ibm_is_lb_pool_member" "lb_pool_member" {
  for_each = var.lb_pool_member
  lb             = var.lb_id
  pool           = each.value.pool_id
  port           = each.value.port
  target_address = each.value.target_address
  depends_on     = [ibm_is_lb_listener.lb_listener]
}