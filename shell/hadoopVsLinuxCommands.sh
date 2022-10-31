#!/usr/bin/env bash

# setting file name for time comparison result
FILE_NAME="hadoopVsLinux.time"

# compile java code of java solution
cd ./java
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wordcount.jar WordCount*.class
cd ..

# hdfs preparation (including input file)
hdfs dfs -rm -r wordCountOutput
hdfs dfs -rm -r wordCountInput
hdfs dfs -mkdir wordCountInput
hdfs dfs -copyFromLocal data/pg4300.txt wordCountInput

# run linux and hadoop command for time comparison
echo 'Running Linux Command...'
echo 'Linux time:' >$FILE_NAME
{ time cat data/pg4300.txt | tr ' ' '\n' | sort | uniq -c >/dev/null; } 2>&1 | tail -n3 >>$FILE_NAME
echo >>$FILE_NAME
echo 'Running Hadoop...'
echo 'Hadoop time:' >>$FILE_NAME
{ time `hadoop jar java/wordcount.jar WordCount wordCountInput wordCountOutput`; } 2>&1 | tail -n3 >>$FILE_NAME

# cleanup class and jar files
rm java/WordCount*.class
rm java/wordcount.jar
