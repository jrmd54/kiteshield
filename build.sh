
git submodule update --init
cd packer/bddisasm
mkdir build
cd build
cmake ..
make CC=clang
cd ../../../
make CC=clang
