#!/bin//bash
#The statement of if...then...else...fi
if[-d $1]
then
  echo "$1 is a directory"
  exit #（退出当前的shell程序）
else
  if[-f $1]
  then
    echo "$1 is a common file"
  else
    echo "unkown"
  fi
fi
