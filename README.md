### Joystream - command line apps builder

Cross platform build tool for building latest version of joystream command line apps.

`joyd`: Daemon (aka fullnode server application)

`joycli`: Command line tool (cli)

Pre-requisites [docker](#docker)

### Usage
Clone this repo and run the build script:

    git clone https://github.com/joystream/joystream-builder
    cd joystream-builder/
    ./build.sh

The build will create binaries for windows, linux and mac(darwin) in the local `bin/` folder:

    bin/
    ├── darwin_amd64
    │   ├── joycli
    │   └── joyd
    ├── linux_amd64
    │   ├── joycli
    │   └── joyd
    └── windows_amd64
        ├── joycli.exe
        └── joyd.exe

`"Builds should be reproducible since we are using go and docker"`

sha1 hashes:

    f07b7c2e7f2af845836156d8eb08cd3e670a73a8  bin/linux_amd64/joycli
    d3a817d7a75f0d074c069c35eb5f3da86edeeb5a  bin/linux_amd64/joyd
    f4685cfd2d7c7b09c6be5375da6b994a76ec1d15  bin/darwin_amd64/joycli
    4827fbd31ff26fbf596fec464b797faf96b884b3  bin/darwin_amd64/joyd
    dace84a9ed3f52759fd06dec9d3d306c2388fc22  bin/windows_amd64/joycli.exe
    65b6120c8f989738ea3e6bf00cb8ce687aa33e3d  bin/windows_amd64/joyd.exe

### Install
After a successful build, move your platform binaries into a location in your shell's `PATH`

Example on mac copying to home directory `~/bin` folder:

    mkdir -p ~/bin
    cp bin/darwin_amd64/* ~/bin

Add the `bin/` folder to the PATH:

    export PATH="$PATH:$HOME/bin"

Run joycli:

    joycli version

..should output the version.

    0.27.0-6-g43d1fc3a-joystream

### Connecting to joystream network

    Consult the [joystream manual](https://github.com/joystream/joystream-manual)

### Changing build configuration
The scripts will build from configured source repo and commit hash set in [build.sh](build.sh)

    export COMMIT=43d1fc3aeef81f492902a5c616a1b517d50262f0
    export SOURCE_REPO="https://github.com/joystream/cosmos-sdk.git"

### <a name="docker"></a> Docker
Install docker on supported platform:
https://docs.docker.com/install/#supported-platforms
