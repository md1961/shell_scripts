#! /bin/sh

HOSTS='ariel mimas sinope'

for host in $HOSTS
do
	echo -e "\e[36m===> $host <===\e[m"
	ssh $host "source ~/.bash_profile; $@"
	echo
done

echo -e "\e[36m===> `hostname` <===\e[m"
$@
