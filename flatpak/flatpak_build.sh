#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
MANIFEST="io.github.spacingbat3.webcord.yml"


cd $SCRIPT_DIR

echo "trying to build"
flatpak-builder build $MANIFEST --force-clean --repo=repo
flatpak build-bundle repo webcord.flatpak io.github.spacingbat3.webcord

# echo "trying to build & install"
# flatpak-builder --user --install --force-clean build $MANIFEST
