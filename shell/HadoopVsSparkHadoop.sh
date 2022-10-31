


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

hdfs dfs -mkdir input2
hdfs dfs -copyFromLocal carman-farhorizons-00-t.txt input2
time hadoop jar wc.jar WordCount input2 output2

wget http://www.gutenberg.ca/ebooks/colby-champlain/colby-champlain-00-t.txt

hdfs dfs -mkdir input3
hdfs dfs -copyFromLocal colby-champlain-00-t.txt input3
time hadoop jar wc.jar WordCount input3 output3

wget http://www.gutenberg.ca/ebooks/cheyneyp-darkbahama/cheyneyp-darkbahama-00-t.txt

hdfs dfs -mkdir input4
hdfs dfs -copyFromLocal cheyneyp-darkbahama-00-t.txt input4
time hadoop jar wc.jar WordCount input4 output4

wget http://www.gutenberg.ca/ebooks/delamare-bumps/delamare-bumps-00-t.txt

hdfs dfs -mkdir input5
hdfs dfs -copyFromLocal delamare-bumps-00-t.txt input5
time hadoop jar wc.jar WordCount input5 output5

wget http://www.gutenberg.ca/ebooks/charlesworth-scene/charlesworth-scene-00-t.txt

hdfs dfs -mkdir input6
hdfs dfs -copyFromLocal charlesworth-scene-00-t.txt input6
time hadoop jar wc.jar WordCount input6 output6

wget http://www.gutenberg.ca/ebooks/delamare-lucy/delamare-lucy-00-t.txt

hdfs dfs -mkdir input7
hdfs dfs -copyFromLocal delamare-lucy-00-t.txt input7
time hadoop jar wc.jar WordCount input7 output7

wget http://www.gutenberg.ca/ebooks/delamare-myfanwy/delamare-myfanwy-00-t.txt

hdfs dfs -mkdir input8
hdfs dfs -copyFromLocal delamare-myfanwy-00-t.txt input8
time hadoop jar wc.jar WordCount input8 output8

wget http://www.gutenberg.ca/ebooks/delamare-penny/delamare-penny-00-t.txt

hdfs dfs -mkdir input9
hdfs dfs -copyFromLocal delamare-penny-00-t.txt input9
time hadoop jar wc.jar WordCount input9 output9
