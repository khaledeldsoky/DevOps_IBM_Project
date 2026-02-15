variable "instance" {

  type = map(object({
    instance_vpc_id             = string
    instance_profile            = string
    instance_zone               = string
    image                       = string
    instance_resource_group     = string
    instance_keys               = string
    instance_subnet_id          = string
    instance_security_groups_id = string
  }))
  
}


variable "region" {}
# variable "ibmcloud_api_key" {}
