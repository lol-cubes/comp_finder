#!/bin/bash

# install package dependencies
pip install -r requirements.txt

# start process and save PID
chmod +x run.sh
./run.sh
processInfo=$(ps -ef | grep "run.py")
i=0
function get_pid {
  for line in $(echo $processInfo | tr " " "\n")
  do
    if [ $i == 0 ];
    then
        echo $line
    fi
  i=$((i + 1))
  done
}

PID=$(get_pid)

# echo PID to console and file
echo $PID > save_pid.txt
echo 'The PID for comp_finder.py is' $PID
echo 'to kill the process:\nkill' $PID