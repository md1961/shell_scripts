#!/bin/bash
set -Ceu

HOSTS_FILE=$(dirname $0)/hosts_for_trans_hosts
HOSTS=$(cat $HOSTS_FILE)

for host in $HOSTS
do
	echo -e "\e[36m===> $host <===\e[m"
	ssh $host "source ~/.bash_profile; $@"
	echo
done

echo -e "\e[36m===> `hostname` <===\e[m"
bash -c "$@"
