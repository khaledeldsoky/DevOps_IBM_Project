resource "null_resource" "bash_script" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    
    command = <<-EOF
    ../bash/copy_ip.sh ${local.master_ip} ${local.private_ip_worker_1} ${local.private_ip_worker_2} ${local.master_name} ${local.private_name_worker_1} ${local.private_name_worker_2}
    ../bash/hosts_ansible.sh  ${local.master_name} ${local.private_name_worker_1} ${local.private_name_worker_2}

    cd ../Ansible/
    ansible-playbook main.yaml 
    EOF
  }
  depends_on = [module.compute]
}


resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 60"
  }
  depends_on = [
    module.network
  ]
}
