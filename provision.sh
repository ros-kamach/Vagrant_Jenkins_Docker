#!/bin/bash
# Install update all
sudo yum install epel-release -y
sudo yum update -y
# Installing Ansible
sudo yum install ansible -y
sudo cat <<EOF | sudo tee -a /etc/ansible/ansible.cfg
[defaults]
host_key_checking = false
inventory = /home/vagrant/hosts.txt
ssh_args = -o ControlMaster=auto -o ControlPersist=60s -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes
EOF
sudo cat <<EOF | sudo tee -a /home/vagrant/hosts.txt
localhost ansible_connection=local
EOF
# echo "Install Docker"
# curl --silent --location https://get.docker.com/ | bash -
# sudo systemctl start docker
# cat <<EOF | sudo tee -a /home/vagrant/Dockerfile
# #---------------------------------------------------------------------------
# # Dockefile to build Docker Image of Apache WebServer running on Ubuntu
# #
# #---------------------------------------------------------------------------

# FROM ubuntu:16.04

# RUN apt-get -y update
# RUN apt-get -y install apache2

# RUN echo 'Hello World from Docker!' > /var/www/html/index.html


# CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
# EXPOSE 80
# EOF
sudo ansible-playbook /home/vagrant/ansible/main.yml