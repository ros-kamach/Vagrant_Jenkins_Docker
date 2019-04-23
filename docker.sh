#!/bin/bash
# Install update all
sudo yum install epel-release -y
sudo yum update -y
# Installing Ansible
sudo yum install ansible -y
echo "Install Docker"
curl --silent --location https://get.docker.com/ | bash -
sudo systemctl start docker
cat <<EOF | sudo tee -a /home/vagrant/Dockerfile
#---------------------------------------------------------------------------
# Dockefile to build Docker Image of Apache WebServer running on Ubuntu
#
# Made by Denis Astahov ADV-IT  13-March-2019
#---------------------------------------------------------------------------

FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install apache2

RUN echo 'Hello World from Docker!' > /var/www/html/index.html


CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]
EXPOSE 80
EOF
sudo ansible-playbook /home/vagrant/ansible/main.yml