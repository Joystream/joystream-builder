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

export GOOS=linux
export GOARCH=arm
export GOARM=5

echo ###############################################################################
echo Building Joystream for Raspberry Pi platform.
echo ###############################################################################
make get_vendor_deps
make install

# Rename gaiad/gaiacli to joyd/joycli
mkdir --parents $TARGET/linux_arm5
cp /go/bin/linux_arm/gaiad $TARGET/linux_arm5/joyd
cp /go/bin/linux_arm/gaiacli $TARGET/linux_arm5/joycli
