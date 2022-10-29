


wget https://raw.githubusercontent.com/KiksZero/CloudComputingAssignment2/main/WordCount.java
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH

hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class

wget http://www.gutenberg.ca/ebooks/buchanj-midwinter/buchanj-midwinter-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal buchanj-midwinter-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/carman-farhorizons/carman-farhorizons-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal carman-farhorizons-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/colby-champlain/colby-champlain-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal colby-champlain-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/cheyneyp-darkbahama/cheyneyp-darkbahama-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal cheyneyp-darkbahama-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/delamare-bumps/delamare-bumps-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal delamare-bumps-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/charlesworth-scene/charlesworth-scene-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal charlesworth-scene-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/delamare-lucy/delamare-lucy-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal delamare-lucy-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/delamare-myfanwy/delamare-myfanwy-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal delamare-myfanwy-00-t.txt input
time hadoop jar wc.jar WordCount input output

wget http://www.gutenberg.ca/ebooks/delamare-penny/delamare-penny-00-t.txt

hdfs dfs -mkdir input
hdfs dfs -copyFromLocal delamare-penny-00-t.txt input
time hadoop jar wc.jar WordCount input output
