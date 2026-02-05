# gfan-install-mac-os

A simple script to install [gfan](https://users-math.au.dk/jensen/software/gfan/gfan.html) by Anders Jensen easily on Mac OS Tahoe 26.2 from source.
Should automate downloading dependencies and running the various build steps, as well as making some minor tweaks to make the code compile against gcc-15 and so forth (possibly unnecessary, but I had to do so to get it working).

The only dependency is that you should have [Homebrew](https://brew.sh/) already (and you should be running this without Rosetta emulation)!

The script assumes the latest versions of `gcc` and of `gmp` are 15 and 6.3.0 respectively. If that's no longer true you may have to change those numbers where they appear in these files.

## Usage
Move the script and patch to a folder you're happy building `gfan` in. It could just be literally the clone of this repo, that's fine. Up to you.
```bash
./install_gfan.sh
```
A bunch of stuff will happen, by the end you should have a `gfan` executable that passes all the tests. Enjoy!
