#!/usr/bin/env zsh
#
# update bundles

for bundle in ~/.vim/bundle/*
do
  (echo "Updating $(basename $bundle)" && cd $bundle && git pull)
done
