#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
MANIFEST="io.github.vegad.webcord.yml"


cd $SCRIPT_DIR

echo "starting build"
flatpak-builder build $MANIFEST --force-clean --repo=repo
echo "trying to build & install"
flatpak-builder --user --install --force-clean build $MANIFEST
