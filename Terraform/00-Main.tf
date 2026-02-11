module "network" {
  # ibmcloud_api_key    = var.ibmcloud_api_key
  source              = "./Network"
  region              = var.region_eu_gb
  zone                = var.zone_eu_gb_2

  resource_group_name = "khaled-eldsoky"
  vpc_id              = module.network.vpc["vpc-khaled"].id

  vpc = {
    "vpc-khaled" = {
      vpc_resource_group_id = module.network.resource_group.id
    }
  }

  GW = {
    "gw-1" ={
      zone = var.zone_eu_gb_2
    }
    "gw-2" ={
      zone = var.zone_eu_gb_3
    }
  }

  address_prefix = {
    "192.168.1" = {
      name = "prefix1-192-168-1"
      cidr = var.cider_block_192_168_1
      zone = var.zone_eu_gb_2
    }

    "192.168.2" = {
      name = "prefix1-192-168-2"
      cidr = var.cider_block_192_168_2
      zone = var.zone_eu_gb_2
    }

    "192.168.3" = {
      name = "prefix2-192-168-3"
      cidr = var.cider_block_192_168_3
      zone = var.zone_eu_gb_3
    }
  }

  subnet = {
    "public-subnet-1" = {
      subnet_zone        = var.zone_eu_gb_2
      subent_vpc_id      = module.network.vpc["vpc-khaled"].id
      subnet_cider_block = var.cider_block_192_168_1
    }

    "private-subnet-1" = {
      subnet_zone        = var.zone_eu_gb_2
      subent_vpc_id      = module.network.vpc["vpc-khaled"].id
      subnet_cider_block = var.cider_block_192_168_2
      public_gateway     = module.network.GW_id["gw-1"].id
    }

    "private-subnet-2" = {
      subnet_zone        = var.zone_eu_gb_3
      subent_vpc_id      = module.network.vpc["vpc-khaled"].id
      subnet_cider_block = var.cider_block_192_168_3
      public_gateway     = module.network.GW_id["gw-2"].id
    }
  }

  F_ip = {
    public-instance-1 = {
      primary_network_interface_id = module.compute.instance["instance-public"].primary_network_interface[0].id
    }
    # public-instance-2  = {
    #   primary_network_interface_id = module.compute.instance["public-instance-2"].primary_network_interface[0].id
    # }
  }

}

module "security" {
  # ibmcloud_api_key = var.ibmcloud_api_key
  source = "./Security"
  region = var.region_eu_gb

  SG = {
    "master" = {
      vpc_id = module.network.vpc["vpc-khaled"].id
    }

    "node" = {
      vpc_id = module.network.vpc["vpc-khaled"].id
    }
  }

  SGR_tcp = {
    for rule in local.TCP : "${rule.type}_${rule.group_name}_${rule.direction}_${rule.name}" => {
      group     = module.security.security_group["${rule.group_name}"].id
      direction = "${rule.direction}"
      remote    = "${rule.remote}"
      port_max  = "${rule.port_max}"
      port_min  = "${rule.port_min}"
    }
  }

  SGR_udp = {
    for rule in local.UDP : "${rule.type}_${rule.group_name}_${rule.direction}_${rule.name}" => {
      group     = module.security.security_group["${rule.group_name}"].id
      direction = "${rule.direction}"
      remote    = "${rule.remote}"
      port_max  = "${rule.port_max}"
      port_min  = "${rule.port_min}"
    }
  }

  SGR_icmp = {
    #---------- inbound ----------#
    SGR_icmp_master_inbound = {
      group     = module.security.security_group["master"].id
      direction = var.direction_inbound
      remote    = var.remote_0
    }

    SGR_icmp_node_inbound = {
      group     = module.security.security_group["node"].id
      direction = var.direction_inbound
      remote    = var.remote_0
    }

    #---------- outbound ----------#
    SGR_icmp_master_outbound = {
      group     = module.security.security_group["master"].id
      direction = var.direction_outbound
      remote    = var.remote_0
    }

    SGR_icmp_node_outbound = {
      group     = module.security.security_group["node"].id
      direction = var.direction_outbound
      remote    = var.remote_0
    }
  }

  ssh_key = {

    master = {
      path     = var.ssh_key_master_path
      ssh_type = var.ssh_type_rsa
    }

    node = {
      path     = var.ssh_key_node_path
      ssh_type = var.ssh_type_rsa
    }
  }

}

module "compute" {
  # ibmcloud_api_key = var.ibmcloud_api_key
  source = "./Compute"
  region = var.region_eu_gb
  instance = {
    "instance-public" = {
      instance_vpc_id             = module.network.vpc["vpc-khaled"].id
      instance_profile            = var.profile_cpu2_ram8
      image                       = data.ibm_is_image.image_ubuntu.id
      instance_zone               = var.zone_eu_gb_2
      instance_resource_group     = module.network.resource_group.id
      instance_keys               = module.security.ssh_key["master"].id
      instance_subnet_id          = module.network.subnet["public-subnet-1"].id
      instance_security_groups_id = module.security.security_group["master"].id
    }

    "instance-private-1" = {
      instance_vpc_id             = module.network.vpc["vpc-khaled"].id
      instance_profile            = var.profile_cpu2_ram8
      image                       = data.ibm_is_image.image_ubuntu.id
      instance_zone               = var.zone_eu_gb_2
      instance_resource_group     = module.network.resource_group.id
      instance_keys               = module.security.ssh_key["node"].id
      instance_subnet_id          = module.network.subnet["private-subnet-1"].id
      instance_security_groups_id = module.security.security_group["node"].id
    }

    "instance-private-2" = {
      instance_vpc_id             = module.network.vpc["vpc-khaled"].id
      instance_profile            = var.profile_cpu2_ram8
      image                       = data.ibm_is_image.image_ubuntu.id
      instance_zone               = var.zone_eu_gb_3
      instance_resource_group     = module.network.resource_group.id
      instance_keys               = module.security.ssh_key["node"].id
      instance_subnet_id          = module.network.subnet["private-subnet-2"].id
      instance_security_groups_id = module.security.security_group["node"].id
    }
  }
}

# module "load_balancer" {
#   source = "./Load_balancer"
#   lb_id  = module.load_balancer.lb_id
#   region = var.region_eu_gb
#   load_balancer = {
#     name        = "public-lb"
#     subents_ids = [module.network.subnet["private-subnet-1"].id, module.network.subnet["private-subnet-2"].id]
#     type        = "public"
#     # route_mode  = true
#   }

#   lb_listener = {
#     port     = 80
#     protocol = "http"
#   }

#   lb_pool = {
#     name = "pool"
#   }

#   lb_pool_member = {
#     member-1 = {
#     pool_id        = module.load_balancer.pool_id
#     port           = 31999
#     target_address = local.private_ip_node_1
#     }

#     member-2 = {
#     pool_id        = module.load_balancer.pool_id
#     port           = 31999
#     target_address = local.private_ip_node_2
#     }
#   }
# }
