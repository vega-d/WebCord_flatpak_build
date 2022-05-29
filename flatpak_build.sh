#!/bin/sh
bash ./clean.sh
bash ./generate_sources_file.sh
flatpak-builder build $1 --force-clean --repo=repo
flatpak-builder --user --install --force-clean build $1
