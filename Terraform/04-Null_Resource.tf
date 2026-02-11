resource "null_resource" "bash_script" {
  provisioner "local-exec" {
    command = <<-EOF
    ../bash/copy_ip.sh ${local.public_ip_master} ${local.private_ip_node_1} ${local.private_ip_node_2}
    cd ../Ansible/
    ansible-playbook main.yaml 
    EOF
  }
  depends_on = [module.compute]
}

