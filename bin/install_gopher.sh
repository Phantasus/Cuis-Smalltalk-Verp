#!/usr/bin/bash

IMAGE="$1"
VM_BIN="squeak"
DEST_DIR="Packages"

mkdir -p "$DEST_DIR"
FETCH="wget -nc -P $DEST_DIR"

echo "--> Downloading external dependencies"
$FETCH https://raw.githubusercontent.com/pbella/OMeta-Cuis/master/OMeta2.pck.st
$FETCH https://raw.githubusercontent.com/pbella/OMeta-Cuis/master/OMeta2Preload.st
$FETCH https://raw.githubusercontent.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/master/Packages/System/Network-Kernel.pck.st

echo "--> Running install script"

squeak "$IMAGE" -s "bin/install_gopher.st"
