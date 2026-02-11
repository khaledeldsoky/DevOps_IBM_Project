resource "ibm_is_lb_listener" "lb_listener" {
  lb                         = var.lb_id
  port                       = var.lb_listener.port
  protocol                   = var.lb_listener.protocol
}



