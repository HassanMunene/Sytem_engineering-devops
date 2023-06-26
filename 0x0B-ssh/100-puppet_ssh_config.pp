# We are using puppet to configure an ssh config file such that no password is required to connect to a server

file{'/home/hassanmunene/.ssh/config':
ensure  => file,
content => "Host 100.26.10.124\n IdentityFile ~/.ssh/school\n PasswordAuthentication no",
}
