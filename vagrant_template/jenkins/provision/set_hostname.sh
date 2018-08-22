#!/bin/bash
fqdn=centos7.test
ip="$(ip addr | grep eth1 | grep inet | awk '{ print $2}' | cut -c 1-12)"
echo $ip
echo "setting the hostname as $fqdn in /etc/hosts file with ipaddress $ip ... "
echo "$ip       $fqdn" >> /etc/hosts
sleep 2
echo ""
printf "writing $fqdn as hostname in kernel..."
sleep 2
sysctl kernel.hostname=$fqdn
echo ""

sleep 2
echo ""
echo "Finally getting repos..."
sleep 3
cd /opt
sudo yum install epel-release
sudo -E yum update -y
sudo yum install -y wget

echo"Installing java"
yum install -y deltarpm
yum install -y java-1.8.0-openjdk
java -version
sudo cp /etc/profile /etc/profile_backup
source /etc/profile

echo"Installing Jenkins"
yum clean all 
sudo -E wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo -E rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
echo"Updating"
yum update -y
sudo -E yum -y install jenkins
sudo chkconfig jenkins on
sudo service jenkins restart

echo"Checking jenkins status"
systemctl status jenkins

echo "Your server is ready with $ip"