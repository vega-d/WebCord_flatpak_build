# WebCord_flatpak_build
A "wrapper" repository for building flatpaks of WebCord, doesn't build successfully as of now.

To try building this app all dependencies I needed were installed with a single command of 
```sudo dnf install flatpak-builder npm```
```sudo npm install --global electron-builder```
A fedora 36 container from dockerhub was used.

to build the tarball, 
```
./tarball/tarball_build.sh
```

to then build the flatpak out of the tarball
```
./flatpak/flatpak_build.sh
```

`clean.sh` should reset the build enviroment in the corresponding folder.
