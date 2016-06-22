# What is cmake-configure
A configure script for cmake projects because there are steps before cmake can run a successful configure and build especially when running crossbuilds and toolchains or SDKs have to be installed first.

So here are the steps that a usual project needs:

# Checkout Source
Get the source code in the workarea.

# Configure
In reference to the GNU build system a simple or complex `configure` bash script setup the build directory.

```
./configure $CONFIGUREOPTIONS
```
* `--build <dir>` build directory
* `--host <buildhost>` name of the host system (if guessed wrong)
* `--target <buildtarget>` name of the target system (if not building for the host system)
* `--enable-<FEATURE>` or `--disable-<FEATURE>` switch some build feature on or off

## Version check
First step of `configure` script should be to check if a hot-fix script should be used, since the original script that comes from the source code checkout could be out-of-date while not including latest adaption for the build environment. If user try to build old revisions of the source code they could be adapted to latest settings via an overwrite of the old configure script.  
There could be a check for a `configure-overwrite` file. If it exists, it is executed with the `--version` option, which output only a 3 parted version number with `MAJOR.MINOR.PATCH` syntax. If this version is higher than the version if the project specific `configure` script an `exec configure-overwrite $*` is invoked to start the overwrite script with all arguments.

## Setup the build directory
Create the build directory that is used for compilation or whatever is necessary before creating output.

Default build directory name is `build/<buildhost>_<buildtarget>`

## Setup toolchain, SDK or libs
Download and/or extract an SDK and a toolchain to use for the build. External libraries could be fetched from different sources, if needed before running other build steps.

## Run cmake configure
If cmake is used for the build, now is the time to run the cmake configure step and prepare the project files.

## Create run_* scripts
If needed the configure step could create, patch or replace the created scripts for the next steps to include hot-fixes for the build.

# Build
```
$BUILDDIR/run_build.sh $BUILDOPTIONS
```

# Install
```
$BUILDDIR/run_install.sh $INSTALLOPTIONS
```

# Package
```
$BUILDDIR/run_package.sh $PACKAGEOPTIONS
```

