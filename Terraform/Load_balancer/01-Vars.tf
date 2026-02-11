variable "load_balancer" {
  type = object({
    name        = string
    subents_ids = list(string)
    type        = string
    route_mode  = optional(bool)
  })
}

variable "lb_id" {
  type = string
}

variable "lb_listener" {
  type = object({
    port     = string
    protocol = string
  })
}

variable "lb_pool" {
  type = object({
    name = string

  })
}

variable "lb_pool_member" {
  type = map(object({
    pool_id        = string
    port           = number
    target_address = string

  }))
}

variable "region" {
  type = string
}
