#!/usr/bin/env bash

if ! [ -x "$(type -P iperf)" ]; then
    echo "ERROR: script requires iperf"
    echo "For Debian and friends get it with 'apt-get install iperf'"
    echo "If you have it, perhaps you don't have permissions to run it, try 'sudo $(basename $0)'"
    exit 1
fi

if [ "$#" -ne "1" ]; then
  echo "ERROR: script needs four arguments, where:"
  echo ""
  exit 1
else
  logfile=$1
 fi

log=iperf.server.$HOSTNAME.log

if [ -f $log ]; then
  echo removing $log
  rm $log
fi

echo "=================================================================="
echo " Running iperf in server mode and logging to $log"
echo "=================================================================="

iperf -s | tee $log &