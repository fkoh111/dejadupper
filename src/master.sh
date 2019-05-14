#!/bin/bash

# Setting variable path to ncftpput.
readonly path_to_ncftpput=$(pwd)/ncftpput.sh

# Setting current network gateway as a boolean.
current_gateway=$(route -n | awk 'FNR == 3 {print $2}')

# Creating simple timestamp function.
timestamp() {
  date '+%Y-%m-%d %H:%M:%S:%Z'
}

log=dejadupper.log

if [ "$current_gateway" == "$gateway_nas" ];
  then
    echo Connecting to NAS server at $(timestamp)
    source $path_to_ncftpput
    echo Exit status was $? - so succesfully \done at $(timestamp) | tee -a $log # stdout to screen and log
    exit 0
  else
    echo Exit status was $? - so you\'re probably on the wrong network $(timestamp) | tee -a $log # stderr to screen and log
    exit 1
  fi

exit
