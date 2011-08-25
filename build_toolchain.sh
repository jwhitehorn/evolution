#!/bin/bash

export PREFIX=$(pwd)/toolchain/local
export TARGET=i386-apple-darwin9.0.0

mkdir toolchain
cd ./toolchain
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

if [ ! -f libc-763.11.tar.gz ];
then
wget http://www.opensource.apple.com/tarballs/Libc/Libc-763.11.tar.gz libc-763.11.tar.gz
fi
tar -xvzf libc-763.11.tar.gz


mkdir build-binutils build-gcc build-libc

cd build-binutils
../binutils-2.21.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls
make all
make install

cd ../build-gcc
export PATH=$PATH:$PREFIX/bin
../gcc-4.6.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls --without-headers
make all
make install-gcc

ln -s $PREFIX/bin/i386-apple-darwin9.0.0-gcc $PREFIX/bin/gcc
ln -s $PREFIX/bin/i386-apple-darwin9.0.0-gcc $PREFIX/bin/cc
ln -s $PREFIX/bin/i386-apple-darwin9.0.0-cpp $PREFIX/bin/cpp

cd ../Libc-763.11
#make build
#todo: get libc compiled

 cp -rv ./include/ $PREFIX/include/


echo "                  .__               "
echo "  _______  ______ |  |___  __ ____  "
echo "_/ __ \  \/ /  _ \|  |\  \/ // __ \ "
echo "\  ___/\   (  <_> )  |_\   /\  ___/ "
echo " \___  >\_/ \____/|____/\_/  \___  >"
echo "     \/                          \/ "
