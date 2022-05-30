#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
cd $SCRIPT_DIR

flatpak remove io.github.spacingbat3.webcord
rm -rf build/ .flatpak-builder/ repo/