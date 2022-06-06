#!/bin/bash

if [ "$1" == "clean" ]; then
  echo "___ cleaning up ___"
  bash ./flatpak/clean.sh
  bash ./tarball/clean.sh
fi

echo "___ creating tarball ___"
bash ./tarball/tarball_build.sh
