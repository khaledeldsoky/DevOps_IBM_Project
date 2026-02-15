module "network" {
  # ibmcloud_api_key    = var.ibmcloud_api_key
  source              = "./Models/Network"
  region              = var.region_eu_gb
  zone                = var.zone_eu_gb_2

  resource_group_name = "khaled-eldsoky"
  vpc_id              = module.network.vpc["vpc-khaled"].id

  vpc = {
    "vpc-khaled" = {
      vpc_resource_group_id = module.network.resource_group.id
    }
  }

  public_gateway = {
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
      public_gateway     = module.network.public_gateway["gw-1"].id
    }

    "private-subnet-2" = {
      subnet_zone        = var.zone_eu_gb_3
      subent_vpc_id      = module.network.vpc["vpc-khaled"].id
      subnet_cider_block = var.cider_block_192_168_3
      public_gateway     = module.network.public_gateway["gw-2"].id
    }
  }

  floating_ip = {
    "master-ip" = {
      primary_network_interface_id = module.compute.instance["instance-master"].primary_network_interface[0].id
    }
  }

}

module "security" {
  # ibmcloud_api_key = var.ibmcloud_api_key
  source = "./Models/Security"
  region = var.region_eu_gb

  security_group = {
    "master" = {
      vpc_id = module.network.vpc["vpc-khaled"].id
    }

    "worker" = {
      vpc_id = module.network.vpc["vpc-khaled"].id
    }
  }

  security_group_rule_tcp = {
    for rule in local.TCP : "${rule.type}_${rule.group_name}_${rule.direction}_${rule.name}" => {
      group     = module.security.security_group["${rule.group_name}"].id
      direction = "${rule.direction}"
      remote    = "${rule.remote}"
      port_max  = "${rule.port_max}"
      port_min  = "${rule.port_min}"
    }
  }

  security_group_rule_udp = {
    for rule in local.UDP : "${rule.type}_${rule.group_name}_${rule.direction}_${rule.name}" => {
      group     = module.security.security_group["${rule.group_name}"].id
      direction = "${rule.direction}"
      remote    = "${rule.remote}"
      port_max  = "${rule.port_max}"
      port_min  = "${rule.port_min}"
    }
  }

  security_group_rule_icmp = {
    #---------- inbound ----------#
    security_group_rule_icmp_master_inbound = {
      group     = module.security.security_group["master"].id
      direction = var.direction_inbound
      remote    = var.remote_0
    }

    security_group_rule_icmp_worker_inbound = {
      group     = module.security.security_group["worker"].id
      direction = var.direction_inbound
      remote    = var.remote_0
    }

    #---------- outbound ----------#
    security_group_rule_icmp_master_outbound = {
      group     = module.security.security_group["master"].id
      direction = var.direction_outbound
      remote    = var.remote_0
    }

    security_group_rule_icmp_worker_outbound = {
      group     = module.security.security_group["worker"].id
      direction = var.direction_outbound
      remote    = var.remote_0
    }
  }

  ssh_key = {

    master = {
      path     = var.ssh_key_master_path
      ssh_type = var.ssh_type_rsa
    }

    worker = {
      path     = var.ssh_key_worker_path
      ssh_type = var.ssh_type_rsa
    }
  }

}

module "compute" {
  # ibmcloud_api_key = var.ibmcloud_api_key
  source = "./Models/Compute"
  region = var.region_eu_gb
  instance = {
    "instance-master" = {
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
      instance_keys               = module.security.ssh_key["worker"].id
      instance_subnet_id          = module.network.subnet["private-subnet-1"].id
      instance_security_groups_id = module.security.security_group["worker"].id
    }

    "instance-private-2" = {
      instance_vpc_id             = module.network.vpc["vpc-khaled"].id
      instance_profile            = var.profile_cpu2_ram8
      image                       = data.ibm_is_image.image_ubuntu.id
      instance_zone               = var.zone_eu_gb_3
      instance_resource_group     = module.network.resource_group.id
      instance_keys               = module.security.ssh_key["worker"].id
      instance_subnet_id          = module.network.subnet["private-subnet-2"].id
      instance_security_groups_id = module.security.security_group["worker"].id
    }
  }
}
