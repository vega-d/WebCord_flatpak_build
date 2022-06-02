#!/bin/bash

TARBALL_NAME="WebCord_tarball.tar.gz"

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cd $SCRIPT_DIR

git clone https://github.com/SpacingBat3/WebCord

cd WebCord

sudo chown -R 1001:121 "/github/home/.npm"

npm install

sudo chown -R 1001:121 "/github/home/.npm"

npm run build

sudo electron-builder -- --linux --dir --config ../electron-builder.yml

cp "./dist/linux-unpacked/" "../WebCord_compiled/"

cd ..

tar -czvf $TARBALL_NAME WebCord_compiled/

mv $TARBALL_NAME ../

echo "____ Finished building tarball ____"
