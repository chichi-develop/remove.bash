#!/bin/bash

PS3="select delete file > "

while [ 0 ]
do
  [ `ls | grep -v remove.bash | wc -l` = 0 ] && exit
  echo "Please select the file/folder you want to delete"
  select answer in `ls | grep -v remove.bash` "exit"
  do
    [ ${answer:=no} = "exit" ] && exit
    echo -n "Are you sure you want to delete $answer ? (Y/n) : "
    read ask
    [ ${ask:=no} = "Y" ] && rm -rf $answer && echo "deleted : $answer" && flg=end
    [ ${flg:=no} = end ] && break
  done
done
