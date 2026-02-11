cat << EOF > ~/.ssh/config
Host bastion
    HostName $1
    User ubuntu
    IdentityFile /home/khaled/khaled-eldsoky/DevOps_IBM/Terraform/ssh_public_key/master
    StrictHostKeyChecking no

Host privateinstance1
    HostName $2
    User ubuntu
    IdentityFile /home/khaled/khaled-eldsoky/DevOps_IBM/Terraform/ssh_public_key/node
    ProxyCommand ssh -q -W %h:%p bastion
    StrictHostKeyChecking no

Host privateinstance2
    HostName $3
    User ubuntu
    IdentityFile /home/khaled/khaled-eldsoky/DevOps_IBM/Terraform/ssh_public_key/node
    ProxyCommand ssh -q -W %h:%p bastion
    StrictHostKeyChecking no
EOF