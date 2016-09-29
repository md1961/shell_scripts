#! /bin/sh

do_toggle=true

if [ -n "$1" ]
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
fi
echo "Now .netrc -> $(ls -l .netrc | awk '{print $NF}')"
popd    > /dev/null
