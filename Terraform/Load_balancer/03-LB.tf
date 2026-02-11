resource "ibm_is_lb" "load_balancer" {
  name       = var.load_balancer.name
  subnets    = var.load_balancer.subents_ids
  type       = var.load_balancer.type
  route_mode = var.load_balancer.route_mode != null ? var.load_balancer.route_mode : null

}

