#!/bin/bash
npm cache clean -force
rm -rf .flatpak-builder/ build/
rm generated-sources.json