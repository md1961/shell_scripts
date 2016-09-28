#! /bin/sh

dest=$(ls -l ~/.netrc | awk '{print $NF}')

if [ "$dest" = ".netrc-japex" ]
then
	dest=.netrc-md1961
else
	dest=.netrc-japex
fi

pushd ~ > /dev/null
ln -sf $dest .netrc
echo "Now .netrc -> $(ls -l .netrc | awk '{print $NF}')"
popd    > /dev/null
