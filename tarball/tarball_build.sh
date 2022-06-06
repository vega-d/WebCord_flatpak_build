#!/bin/bash



SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cd $SCRIPT_DIR


TAG_NAME=$(bash ./get_latest_version_string.sh)

wget "https://github.com/SpacingBat3/WebCord/archive/refs/tags/$TAG_NAME.tar.gz"


TARBALL_NAME="WebCord_$TAG_NAME.tar.gz"

tar -xvzf v*

cd WebCord-*

npm install

sudo chown -R 1001:121 "/github/home/.npm"

npm run build

sudo chown -R 1001:121 "/github/home/.npm"

npm install

sudo chown -R 1001:121 "/github/home/.npm"

npm run build

sudo electron-builder -- --linux --dir --config ../electron-builder.yml

cp -r "./dist/linux-unpacked/" "../WebCord_compiled/"

cd ..

tar -czvf $TARBALL_NAME WebCord_compiled/

if [ $(wc -c <"./$TARBALL_NAME") -gt 45 ]; then
  mv $TARBALL_NAME ../
  echo "tag=$TAG_NAME" >> $GITHUB_ENV
  echo "____ Finished building tarball ____"
else
  echo "____ TARBALL FAILED TO BUILD, CHECK SIZE ____"
fi