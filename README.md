# OpenSpace-AppleSiliconMac
Attempting to build the latest version OpenSpace for Apple Silicon Macs.

**Stopping work on this to concentrate on Linux arm64 instead - and then try running under [UTM](https://techblog.shippio.io/how-to-run-an-ubuntu-22-04-vm-on-m1-m2-apple-silicon-9554adf4fda1)**

Why?

1. Since I don't know much about Mac packaging intricacies, even if I get it to build, it's not in a usable form for general users. Some interplay of CEF and accelerated graphics causes crashes with pre-built openspace binaries.
2. MacOS seems to be a moving target. Github runner with MacOSX15.0.sdk compiles OK, but on a system with MacOSX15.5.sdk, doesn't compile! And so on, an unending procession of incompatibilities.
