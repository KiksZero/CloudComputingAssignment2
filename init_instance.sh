#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-8-jdk-headless -y
su ubuntu
sudo curl -o hadoop-3.3.4.tar.gz "https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz"
tar -xf hadoop-3.3.4.tar.gz -C /usr/local/
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.profile
source ~/.profile
echo "export PATH=$JAVA_HOME/bin" >> ~/.profile
echo "export HADOOP_PREFIX=/usr/local/hadoop-3.3.4" >> ~/.profile
source ~/.profile
echo "export PATH=$HADOOP_PREFIX/bin:$PATH" >> ~/.profile
echo -e "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\nexport HADOOP_PREFIX=/usr/local/hadoop-3.3.4" >> etc/hadoop/hadoop-env.sh
hadoop

