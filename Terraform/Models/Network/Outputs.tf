output "vpc" {
  value = { for vpcs in ibm_is_vpc.vpc : vpcs.name => {
    id   = vpcs.id
    name = vpcs.name
  } }
}


output "subnet" {
  value = { for subnets in ibm_is_subnet.subnet : subnets.name => {
    id   = subnets.id
    name = subnets.name
    } 
  }

}


output "resource_group" {
  value = ibm_resource_group.resource_group
}


output "floating_ip" {
  value = [ for F_ip in ibm_is_floating_ip.floating_ip : F_ip]
}


output "routing_table" {
  value = ibm_is_vpc_routing_table.vpc_routing_table.routing_table
}


output "public_gateway" {
    value = { for GWs in ibm_is_public_gateway.public_gateway : GWs.name => {
    id   = GWs.id
    name = GWs.name
    } 
  }
}