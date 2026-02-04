#!/usr/bin/env bash

set -Eeuo pipefai

echo "Installing gmp with Homebrew"
# Install pre-requesites
brew search gmp
brew install gmp

echo "Getting cdd"
wget https://people.inf.ethz.ch/~fukudak/cdd_home/Cddtarfiles_pub/cddlib-094i.tar.gz
tar -xvf cddlib-094i.tar.gz

echo "Getting gfan"
wget https://users-math.au.dk/jensen/software/gfan/gfan0.7.tar.gz
tar -xvf gfan0.7.tar.gz

ROOT_PATH=$(pwd)

echo "Build cdd"
cd cddlib-094i
./configure --prefix="$ROOT_PATH/gfan0.7/cddlib" CFLAGS="-I/opt/homebrew/Cellar/gmp/6.3.0/include -L/opt/homebrew/Cellar/gmp/6.3.0/lib"
make
make install

cd ..
cd gfan0.7

echo "Tweaking gfan for Mac OS"
git init
git add .
git commit -m "Initial"
git apply make_macable.patch

echo "Building gfan"
make cddpath=$ROOT_PATH/gfan0.7/cddlib gmppath=/opt/Homebrew/Cellar/gmp/6.3.0/ cddnoprefix=true

echo "Testing gfan"
./gfan _test
