#!/usr/bin/env bash

# This script pulls latest commits for all the repos
# inside ~/Project/learn directory

pushd /home/pritesh/Projects/learn-docs > /dev/null

# Note: the '\' in '\ls' is to use original ls command
# since I have it aliased to exa.
for dir in $(\ls -d */); do
  pushd $dir > /dev/null
  echo "Updating $dir..."
  git pull > /dev/null
  popd > /dev/null
done
echo "All Done!"
popd > /dev/null
