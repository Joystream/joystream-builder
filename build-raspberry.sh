#!/bin/sh

# This is the commit of the SDK version to use for building Joystream binaries
# We use an explicit hash instead of a tag so we don't have to trust GitHub.
export COMMIT=1dbaa64082d19ee4d44758a5f1a3d93cb0682b46
export SOURCE_REPO="https://github.com/joystream/cosmos-sdk.git"

source="$(pwd)/bin/"
mkdir -p "$source"
export TARGET=/mnt

docker run \
  --interactive \
  --env SOURCE_REPO \
  --env COMMIT \
  --env TARGET \
  --mount type=bind,source="$source",target="$TARGET" \
  --rm \
  golang:1.11.1 < _build-raspberry.sh
