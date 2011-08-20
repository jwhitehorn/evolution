
task :build_toolchain do

  `export PREFIX=$(pwd)/toolchain/local`
  `export TARGET=i386-apple-darwin9.0.0`

  mk_dir "./toolchain"
  mk_dir "./toolchain/src"
  mk_dir "./toolchain/local"

  puts "Downloading gcc"
  download "http://ftp.gnu.org/gnu/gcc/gcc-4.6.1/gcc-4.6.1.tar.gz", "./toolchain/src/gcc-4.6.1.tar.gz"
  decompress "./toolchain/src/gcc-4.6.1.tar.gz", "./toolchain/src"

  puts "Downloading binutils"
  download "http://ftp.gnu.org/gnu/binutils/binutils-2.21.1.tar.gz", "./toolchain/src/binutils-2.21.1.tar.gz"
  decompress "./toolchain/src/binutils-2.21.1.tar.gz", "./toolchain/src"

  puts "Downloading libc"
  download "http://www.opensource.apple.com/tarballs/Libc/Libc-763.11.tar.gz", "./toolchain/src/libc-763.11.tar.gz"
  decompress "./toolchain/src/libc-763.11.tar.gz", "./toolchain/src"
 
  mk_dir "./toolchain/src/build-binutils"
  mk_dir "./toolchain/src/build-gcc"
  mk_dir "./toolchain/src/build-libc" 

  `cd ./toolchain/src/build-binutils && ../binutils-2.21.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls && make all && make install`
  `cd ./toolchain/src/build-gcc && export PATH=$PATH:$PREFIX/bin && ../gcc-4.6.1/configure --target=$TARGET --prefix=$PREFIX --disable-nls --without-headers && make all && make install-gcc`

end

def download url, file 
  `curl #{url} -o #{file} -#`
end

def decompress file, destination
  `gzip -d < #{file} | (cd #{destination} && tar -xf -)`
end

def mk_dir dir
  Dir.mkdir dir unless File.exists? dir
end
