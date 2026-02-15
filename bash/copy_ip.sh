cat << EOF > ~/.ssh/config
Host $4
    HostName $1
    User ubuntu
    IdentityFile ~/.ssh/master
    StrictHostKeyChecking no

Host $5
    HostName $2
    User ubuntu
    IdentityFile ~/.ssh/worker
    ProxyCommand ssh -q -W %h:%p $4
    StrictHostKeyChecking no

Host $6
    HostName $3
    User ubuntu
    IdentityFile ~/.ssh/worker
    ProxyCommand ssh -q -W %h:%p $4
    StrictHostKeyChecking no
EOF