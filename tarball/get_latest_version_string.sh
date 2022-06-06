#!/usr/bin/env bash
wget https://github.com/SpacingBat3/WebCord/releases/latest -q
LATEST_RELEASE="$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')";
echo "$LATEST_RELEASE" | grep -oP "^/SpacingBat3/WebCord/archive/refs/tags/\K.*" | sed -e s/.tar.gz$//
