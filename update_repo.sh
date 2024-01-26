#!/bin/bash

rm KABI.db*

echo "repo-add"
repo-add -n -R KABI.db.tar.gz *.pkg.tar.zst

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
