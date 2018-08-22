#!/bin/bash
fqdn=centos7-git.test
ip="$(ip addr | grep eth1 | grep inet | awk '{ print $2}' | cut -c 1-12)"
echo $ip
echo "setting the hostname as $fqdn in /etc/hosts file with ipaddress $ip ... "
echo "$ip       $fqdn" >> /etc/hosts
sleep 2
echo ""
printf "writing $fqdn as hostname in kernel..."
sleep 2
sysctl kernel.hostname=$fqdn

sleep 2
echo ""
echo "Finally getting repos..."
sleep 3
cd /opt
yum install -y epel-release
yum install -y wget
yum install -y sudo 
yum install -y deltarpm

echo "Installing dependencies"
sudo yum groupinstall -y "Development Tools"
sudo yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

echo "Downloading tarball file"
#you can change the url as your requirement and download any version of git 
wget https://github.com/git/git/archive/v2.1.2.tar.gz -O git.tar.gz

echo "Unpacking compressed files"
tar -zxf git.tar.gz
cd git-*

echo"Installing git server"
sudo make configure
./configure --prefix=/usr/local
sudo make install

echo "Git version"
git --version
echo "Your server is ready with $ip"