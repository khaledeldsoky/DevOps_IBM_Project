cat << EOF > /home/khaled/khaled/Projects/DevOps/DevOps_IBM-Full/Ansible/hosts
[master]
$1
[worker]
$2
$3
EOF