# OpenSpace-AppleSiliconMac
Attempting to build the latest version OpenSpace for Apple Silicon Macs.

Update: December 2025 - 

1. I've got access to a Mac and an Apple developer account
2. Github runner macos-26 is available in public preview
3. XCode 16.4 and higher have much better compatibility with OpenSpace code
4. Hence trying builds [like these](https://github.com/hn-88/OpenSpace-AppImage/blob/6578bb884e1de7935220e2ea0ffbcd05d19f3509/.github/workflows/macos-26-arm64.yml). Patches are at [MacOS-patches](https://github.com/hn-88/OpenSpace-AppImage/tree/6578bb884e1de7935220e2ea0ffbcd05d19f3509/MacOS-patches)
5. Stock OpenSpace, which uses double-precision OpenGL calls, [just crashes](https://hnsws.blogspot.com/2025/12/running-openspace-on-apple-silicon-and.html).
6. So, further development would need to use the [single-precision patches](https://github.com/hn-88/OpenSpace-single-precision/blob/9de7248a1b53ff16be448f0ca000be031d545eab/.github/workflows/appimage-22.04-patch-setattribute.yml#L76).

~~Stopping work on this to concentrate on Linux arm64 instead - and then try running under [UTM](https://techblog.shippio.io/how-to-run-an-ubuntu-22-04-vm-on-m1-m2-apple-silicon-9554adf4fda1)~~

~~Why?~~

~~1. Since I don't know much about Mac packaging intricacies, even if I get it to build, it's not in a usable form for general users. Some interplay of CEF and accelerated graphics causes crashes with pre-built openspace binaries.
2. MacOS seems to be a moving target. Github runner with MacOSX15.0.sdk compiles OK, but on a system with MacOSX15.5.sdk, doesn't compile! And so on, an unending procession of incompatibilities.~~
