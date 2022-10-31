#!/usr/bin/env bash

# test if we search for at least one user id
if [ "$#" -lt 1 ]
then
  echo 'Provide at least one user id to get results for!'
  exit 1
fi

# cleanup and hdfs preparation (including input file)
rm selectedIdsResult 2> /dev/null
hdfs dfs -rm -r friendsOutput
hdfs dfs -rm -r friendsInput
hdfs dfs -mkdir friendsInput
hdfs dfs -copyFromLocal data/FriendsNetworkInput.txt friendsInput

# compile java code of our solution
cd ./java
hadoop com.sun.tools.javac.Main FriendsMapReduce.java
jar cf friends.jar FriendsMapReduce*.class

# run hadoop
cd ..
hadoop jar java/friends.jar FriendsMapReduce friendsInput friendsOutput

# cleanup class and jar files
rm java/FriendsMapReduce*.class
rm java/friends.jar

# save results for specified ids into file
touch selectedIdsResult
for NUMBER in "$@"
do
  grep "^$NUMBER\s.*\$" friendsOutput/part-r-00000 >> selectedIdsResult
done

echo 'DONE! See "selectedIdsResult" file in project root for top 10 friend suggestions for selected user IDs'
