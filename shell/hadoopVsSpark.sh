#!/usr/bin/env bash

FILE_NAME='hadoopVsSpark.time'

# compile java code of java WordCount solution
cd ./java
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wordcount.jar WordCount*.class
cd ..

# create hdfs input folder
hdfs dfs -mkdir hadoopVsSparkInput

# copy into hadoop fs and process all 9 input files specified in the assignment
for FILE in `ls data/-00- | cut -d"/" -f2`
do
  hdfs dfs -copyFromLocal "data/$FILE" hadoopVsSparkInput
  echo "\n$FILE" >>$FILE_NAME
  echo 'Hadoop time:' >>$FILE_NAME
  { time hadoop jar java/wordcount.jar WordCount "hadoopVsSparkInput/$FILE" hadoopVsSparkOutput; } 2>&1 | tail -n3 >>$FILE_NAME

  # cleanup output folder after each
  hdfs dfs -rm -r hadoopVsSparkOutput
done

# cleanup input folder and jar & class files
hdfs dfs -rm -r hadoopVsSparkInput
rm java/WordCount*.class
rm java/wordcount.jar
