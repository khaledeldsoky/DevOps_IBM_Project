# ----------- All ----------- #
# variable "ibmcloud_api_key" {}
# ----------- Network ----------- #

# variable "zone_eu_gb" {}
# variable "zone_eu_gb" {}
variable "region_eu_gb" {}
variable "zone_eu_gb_2" {}
variable "zone_eu_gb_3" {}

variable "cider_block_192_168_1" {}
variable "cider_block_192_168_2" {}
variable "cider_block_192_168_3" {}
variable "cider_block_192_168_4" {}

# ----------- Security ----------- #
variable "direction_inbound" {}
variable "direction_outbound" {}

variable "remote_0" {}

variable "port_max_22" {}
variable "port_min_22" {}
variable "port_max_443" {}
variable "port_min_443" {}
variable "port_max_80" {}
variable "port_min_80" {}
variable "port_max_53" {}
variable "port_min_53" {}

variable "ssh_key_master_path" {}
variable "ssh_key_mohsen_path" {}
variable "ssh_key_node_path" {}

variable "ssh_type_rsa" {}

# ----------- Compute ----------- #

variable "profile_cpu2_ram8" {}
variable "profile_cpu8_ram32" {}


# ----------- null_resource ----------- #
