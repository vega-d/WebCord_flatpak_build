#!/bin/sh
git clone https://github.com/vega-d/WebCord
cd WebCord
npm i --only=prod --package-lock-only
cd ..
python3 flatpak-node-generator.py npm --xdg-layout ./WebCord/package-lock.json
rm -rf WebCord