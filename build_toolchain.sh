#!/bin/bash

export PREFIX=$(pwd)/local/cross
export TARGET=i386-apple-darwin9.0.0

#brew install gmp
#brew install mpfr
#brew install mpc

mkdir src
cd ./src
if [ ! -f gcc-4.6.1.tar.gz ];
then
wget http://ftp.gnu.org/gnu/gcc/gcc-4.6.1/gcc-4.6.1.tar.gz -O gcc-4.6.1.tar.gz
fi
tar -xvzf gcc-4.6.1.tar.gz
if [ ! -f binutils-2.21.1.tar.gz ];
then
wget http://ftp.gnu.org/gnu/binutils/binutils-2.21.1.tar.gz -O binutils-2.21.1.tar.gz
fi
tar -xvzf binutils-2.21.1.tar.gz
mkdir build-binutils build-gcc

cd build-binutils
../binutils-2.21.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls
make all
make install

cd ../build-gcc
export PATH=$PATH:$PREFIX/bin
../gcc-4.6.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls --without-headers
make all
make install
