resource "ibm_is_lb_pool" "lb_pool" {
  lb                 = var.lb_id
  name               = var.lb_pool.name
  protocol           = "http"
  algorithm          = "round_robin"
  health_delay       = "5"
  health_retries     = "2"
  health_timeout     = "2"
  health_type        = "http"
  health_monitor_url = "/"
  depends_on         = [ibm_is_lb_listener.lb_listener]
}
