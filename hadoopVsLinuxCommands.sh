#!/usr/bin/env bash

wget https://raw.githubusercontent.com/KiksZero/CloudComputingAssignment2/main/WordCount.java
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class
wget https://raw.githubusercontent.com/KiksZero/CloudComputingAssignment2/main/pg4300.txt
hdfs dfs -mkdir input
hdfs dfs -copyFromLocal pg4300.txt input

time cat pg4300.txt | tr ' ' '\n' | sort | uniq -c > /dev/null
time hadoop jar wc.jar WordCount input output
