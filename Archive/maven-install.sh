#!/bin/bash
sudo su
yum update
amazon-linux-extras install java-openjdk11
java --version
wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
yum install -y apache-maven

## Configure MAVEN_HOME 
echo "MAVEN_HOME=/usr/share/apache-maven" >> .bash_profile
echo "PATH=$MAVEN_HOME/bin:$PATH" >> .bash_profile
source .bash_profile
mvn -v

## Provision Jenkins Master Access
sudo su
useradd jenkinsmaster 
echo jenkinsmaster | passwd jenkinsmaster --stdin ## Amazon Linux

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo "jenkinsmaster ALL=(ALL)" >> /etc/sudoers
chown -R jenkinsmaster:jenkinsmaster /opt

## Install git
yum install git -y

## Download settings.xml into .m2 for Authorization
mkdir /home/jenkinsmaster/.m2
wget https://raw.githubusercontent.com/jdrose14/jenkins-master-client-project/maven-sonarqube-nexus-jenkins/settings.xml -P /home/jenkinsmaster/.m2/