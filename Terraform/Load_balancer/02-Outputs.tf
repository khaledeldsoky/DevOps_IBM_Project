output "lb_id" {
  value = ibm_is_lb.load_balancer.id
}

output "pool_id" {
  value = ibm_is_lb_pool.lb_pool.id
}