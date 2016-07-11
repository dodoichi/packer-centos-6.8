#!/bin/bash

sudo yum update -y
sudo yum install -y epel-release
sudo yum groupinstall -y "Development Tools"
sudo yum install -y dkms
sudo yum install -y mlocate
sudo mkdir /mnt/cdrom
sudo mount -t iso9660 -o loop VBoxGuestAdditions.iso /mnt/cdrom/
pushd /mnt/cdrom/
sudo ./VBoxLinuxAdditions.run
popd
mkdir ~/.ssh
pushd .ssh
curl -sS https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > authorized_keys
chmod 0600 authorized_keys
popd
chmod 0700 .ssh

