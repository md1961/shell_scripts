#!/bin/bash
set -Ceu

TIMEOUT_IN_SECOND=3

HOSTS_FILE=$(dirname $0)/hosts_for_trans_hosts
HOSTS=$(cat $HOSTS_FILE)

for host in $HOSTS
do
    echo -e "\e[36m===> $host <===\e[m"
    set +e
    ssh -o "ConnectTimeout $TIMEOUT_IN_SECOND" $host "source ~/.bash_profile; $*"
    set -e
    echo
done

echo -e "\e[36m===> `hostname` <===\e[m"
bash -c "$*"
