locals {
  private_ip_node_1 = module.compute.instance["instance-private-1"].primary_network_interface[0].primary_ipv4_address

  private_ip_node_2 = module.compute.instance["instance-private-2"].primary_network_interface[0].primary_ipv4_address

  public_ip_master = data.ibm_is_floating_ip.public_ip_master.address

  TCP = [

    # ----------------------------- master  ----------------------------- #
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "ssh", port_min = 22, port_max = 22 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "DNS", port_min = 53, port_max = 53 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "http", port_min = 80, port_max = 80 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "https", port_min = 443, port_max = 443 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "2379", port_min = 2379, port_max = 2380 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "10250", port_min = 10250, port_max = 10250 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "10251", port_min = 10251, port_max = 10251 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "10252", port_min = 10252, port_max = 10252 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "6443", port_min = 6443, port_max = 6443 },

    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "ssh", port_min = 22, port_max = 22 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "DNS", port_min = 53, port_max = 53 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "http", port_min = 80, port_max = 80 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "https", port_min = 443, port_max = 443 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "10250", port_min = 10250, port_max = 10250 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "10251", port_min = 10251, port_max = 10251 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "10252", port_min = 10252, port_max = 10252 },
    { type = "TCP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "6443", port_min = 6443, port_max = 6443 },

    # ----------------------------- node  ----------------------------- #
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "ssh", port_min = 22, port_max = 22 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "DNS", port_min = 53, port_max = 53 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "http", port_min = 80, port_max = 80 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "https", port_min = 443, port_max = 443 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "10250", port_min = 10250, port_max = 10250 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "10251", port_min = 10251, port_max = 10251 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "10252", port_min = 10252, port_max = 10252 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "2379_to_2380", port_min = 2379, port_max = 2380 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "6443", port_min = 6443, port_max = 6443 },

    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "ssh", port_min = 22, port_max = 22 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "DNS", port_min = 53, port_max = 53 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "http", port_min = 80, port_max = 80 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "https", port_min = 443, port_max = 443 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "10250", port_min = 10250, port_max = 10250 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "10251", port_min = 10251, port_max = 10251 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "10252", port_min = 10252, port_max = 10252 },
    { type = "TCP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "6443", port_min = 6443, port_max = 6443 },

    # ----------------------------- mohsen  ----------------------------- #
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "ssh", port_min = 22, port_max = 22 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "DNS", port_min = 53, port_max = 53 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "http", port_min = 80, port_max = 80 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "https", port_min = 443, port_max = 443 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "10250", port_min = 10250, port_max = 10250 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "10251", port_min = 10251, port_max = 10251 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "10252", port_min = 10252, port_max = 10252 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "inbound", name = "2379_to_2380", port_min = 2379, port_max = 2380 },

    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "ssh", direction = "outbound", port_min = 22, port_max = 22 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "DNS", direction = "outbound", port_min = 53, port_max = 53 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "http", port_min = 80, port_max = 80 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "https", port_min = 443, port_max = 443 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "10250", direction = "outbound", port_min = 10250, port_max = 10250 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "10251", direction = "outbound", port_min = 10251, port_max = 10251 },
    # { group_name = "mohsen", remote = "0.0.0.0/0", direction = "outbound", name = "10252", direction = "outbound", port_min = 10252, port_max = 10252 },

  ]

  UDP = [

    # ----------------------------- master  ----------------------------- #
    { type = "UDP", group_name = "master", remote = "0.0.0.0/0", direction = "inbound", name = "6783", port_min = 6783, port_max = 6783 },

    { type = "UDP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "UDP", group_name = "master", remote = "0.0.0.0/0", direction = "outbound", name = "6784", port_min = 6783, port_max = 6784 },

    # ----------------------------- node  ----------------------------- #
    { type = "UDP", group_name = "node", remote = "0.0.0.0/0", direction = "inbound", name = "6783", port_min = 6783, port_max = 6783 },

    { type = "UDP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "6783", port_min = 6783, port_max = 6783 },
    { type = "UDP", group_name = "node", remote = "0.0.0.0/0", direction = "outbound", name = "6784", port_min = 6783, port_max = 6784 },
  ]



}


