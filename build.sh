#!/bin/bash

if [ "$1" == "clean" ]; then
  echo "___ cleaning up ___"
  bash ./flatpak/clean.sh
  bash ./tarball/clean.sh
fi

echo "___ creating tarball ___"
bash ./tarball/tarball_build.sh

if [ $(wc -c <"./WebCord_tarball.tar.gz") -gt 45 ]; then
  echo "___ creating flatpak ___"
  bash ./flatpak/flatpak_build.sh
else 
  echo "___ tarball is too small, did the build fail? ___"
  echo "!!!DID NOT CREATE FLATPAK!!!"
  exit 1
fi