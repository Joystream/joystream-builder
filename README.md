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

### Install
After a successful build, move your platform binaries into a location in your shell's `PATH`

Example on mac copying to home directory `~/bin` folder:

    mkdir -p ~/bin
    cp bin/darwin_amd64/* ~/bin

Add the `bin/` folder to the PATH in your .bashrc or .bash_profile:

    export PATH="$PATH:$HOME/bin"

Run joycli:

    joycli version

..should output the version.

    0.29.0-30-g1dbaa640-joystream

### Connecting to joystream network

Consult the [joystream manual](https://github.com/joystream/joystream-manual)

### Changing build configuration
The scripts will build from configured source repo and commit hash set in [build.sh](build.sh)

### <a name="docker"></a> Docker
Install docker on supported platform:
https://docs.docker.com/install/#supported-platforms


### Building Raspberry Pi binaries

Raspberry Pi binaries (ARM5 architecture) can be built with:

    ./build-raspberry.sh


will produce:

    ./bin/linux_arm5/joyd
    ./bin/linux_arm5/joycli
