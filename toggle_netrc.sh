#!/bin/bash
set -Ceu

do_toggle=true

if [ $# -ge 1 ]
then
	do_toggle=
fi

dest=$(ls -l ~/.netrc | awk '{print $NF}')

if [ "$dest" = ".netrc-japex" ]
then
	dest=.netrc-md1961
else
	dest=.netrc-japex
fi

pushd ~ > /dev/null
if [ "$do_toggle" = "true" ]
then
	ln -sf $dest .netrc
    echo -n 'Toggled: '
fi
echo ".netrc -> $(ls -l .netrc | awk '{print $NF}')"
popd    > /dev/null
