#!/bin/bash



SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

cd $SCRIPT_DIR

wget https://github.com/SpacingBat3/WebCord/releases/latest
LATEST_RELEASE="$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')";

wget "https://github.com$LATEST_RELEASE"

TAG_NAME=$(ls | find -- *.tar.gz | sed -e "s/.tar.gz$//")
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

  echo "____ Finished building tarball ____"
else
  echo "____ TARBALL FAILED TO BUILD, CHECK SIZE ____"
fi