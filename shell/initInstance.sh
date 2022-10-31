#!/usr/bin/env bash

# update instance packages and install java 8 jdk
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-8-jdk-headless -y
su ubuntu

# download and install hadoop
sudo curl -o hadoop-3.3.4.tar.gz "https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz"
tar -xf hadoop-3.3.4.tar.gz -C /usr/local/
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/ubuntu/.profile
source /home/ubuntu/.profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/ubuntu/.profile
echo "export HADOOP_HOME=/usr/local/hadoop-3.3.4" >> /home/ubuntu/.profile
source /home/ubuntu/.profile
echo "export PATH=$HADOOP_HOME/bin:$PATH" >> /home/ubuntu/.profile
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\nexport HADOOP_HOME=/usr/local/hadoop-3.3.4" >> /etc/hadoop/hadoop-env.sh
echo "export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar" >> /home/ubuntu/.profile

# install spark
sudo apt install python3-pip -y
pip install pyspark

# clone our repo with all scripts, java files and data inputs
cd ~
git clone https://github.com/KiksZero/CloudComputingAssignment2.git
