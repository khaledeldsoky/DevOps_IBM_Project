variable "ssh_key" {
  type = map(object({
    path     = string
    ssh_type = string
  }))
}

variable "security_group" {
  type = map(object({
    vpc_id = string
  }))
}


variable "security_group_rule_tcp" {
  type = map(object({
    group     = string
    direction = string
    remote    = string
    port_max  = number
    port_min  = number
  }))
}

variable "security_group_rule_udp" {
  type = map(object({
    group     = string
    direction = string
    remote    = string
    port_max  = number
    port_min  = number
  }))
}

variable "security_group_rule_icmp" {
  type = map(object({
    group     = string
    direction = string
    remote    = string
  }))
}








variable "region" {}

# variable "ibmcloud_api_key" {}