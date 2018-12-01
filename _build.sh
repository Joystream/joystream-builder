#!/bin/sh

# Download the Cosmos SDK.
mkdir --parents $GOPATH/src/github.com/cosmos
cd $GOPATH/src/github.com/cosmos
git clone $SOURCE_REPO cosmos-sdk
cd cosmos-sdk
git checkout $COMMIT
echo ###############################################################################
echo Installing development tools.
echo ###############################################################################
make get_tools

# Build Joystream for each platform.

export GOOS
platforms="darwin linux windows"

for GOOS in $platforms; do
  echo ###############################################################################
  echo Building Joystream for $GOOS platform.
  echo ###############################################################################
  make get_vendor_deps
  make install
done

# Rename gaiad/gaiacli to joyd/joycli
mkdir --parents $TARGET/linux_amd64
cp /go/bin/gaiad $TARGET/linux_amd64/joyd
cp /go/bin/gaiacli $TARGET/linux_amd64/joycli

mkdir --parents $TARGET/windows_amd64
cp /go/bin/windows_amd64/gaiad.exe $TARGET/windows_amd64/joyd.exe
cp /go/bin/windows_amd64/gaiacli.exe $TARGET/windows_amd64/joycli.exe

mkdir --parents $TARGET/darwin_amd64
cp /go/bin/darwin_amd64/gaiad $TARGET/darwin_amd64/joyd
cp /go/bin/darwin_amd64/gaiacli $TARGET/darwin_amd64/joycli
