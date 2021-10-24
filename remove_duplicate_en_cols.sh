#!/bin/bash
# This removes duplicate columns with en
# remove_duplicate_en_cols.sh file

count=1
firstEN=
cutFields=
for i in $(head -1 $1 | tr -d '"' | tr "," " "); do
  if [ -z "$firstEN" ] && [ "$i" == "en" ]; then
    firstEN=$count
    cutFields="${cutFields},${count}"
  elif [ "$i" != "en" ]; then
    if [ -z "$cutFields" ]; then
      cutFields="$count"
    else
      cutFields="${cutFields},${count}"
    fi
  fi
  ((count=count+1))
done
cut -d, -f $cutFields $1

