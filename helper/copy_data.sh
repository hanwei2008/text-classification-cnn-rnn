#!/bin/bash

# copy MAXCOUNT files from each directory
if [ $# -gt 0 ];then
    THUCNews=$1
else
    echo "至少需要一个参数指定源数据目录"
    exit 1
fi

MAXCOUNT=6500

for category in $( ls $THUCNews); do
  echo item: $category

  dir=$THUCNews/$category
  newdir=data/thucnews/$category
  if [ -d $newdir ]; then
    rm -rf $newdir
  fi
  mkdir $newdir

  COUNTER=1
  for i in $(ls $dir); do
    cp  $dir/$i $newdir
    if [ $COUNTER -ge $MAXCOUNT ]
    then
      echo finished
      break
    fi
    let "COUNTER++"
  done

done
