#! /bin/sh
set -Ceu

HOST=rael
FILENAME=~/todo.txt

EDIT=
if [ $# -eq 1 ] && [ "$1" = "-e" ]
then
    EDIT=1
fi

if [ "$(hostname)" = "$HOST" ]
then
    if [ $EDIT ]
    then
        vim $FILENAME
    else
        cat $FILENAME
    fi
else
    if [ $EDIT ]
    then
        vim scp://$HOST/$FILENAME
    else
        ssh $HOST cat $FILENAME
    fi
fi
