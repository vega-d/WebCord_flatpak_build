#!/bin/sh
#rm -rf repo
#mkdir repo
#flatpak build-bundle repo package.flatpak "$1"
flatpak-builder build $1 --force-clean --repo=repo
flatpak-builder --user --install --force-clean build $1
