rm -f *.bc *.html *.wasm *.js *.ll

echo Using LLVM_PATH=$LLVM_PATH LLVM_VERSION=$LLVM_VERSION

export FC="$LLVM_PATH/bin/flang-new"
export CC="$LLVM_PATH/bin/clang"
export CCFLAGS="-cc1 -emit-llvm -I$LLVM_PATH/lib/clang/$LLVM_VERSION/include/ -I/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/"
export FCFLAGS="-fc1 -emit-llvm"
# export LD_LIBRARY_PATH="$LLVM_PATH/lib/:$LD_LIBRARY_PATH"
# export DYLD_LIBRARY_PATH="$LLVM_PATH/lib/:$DYLD_LIBRARY_PATH"
# export LDFLAGS="-L$LLVM_PATH/lib"
export ECC_FLAGS="-sWASM=1 -sERROR_ON_UNDEFINED_SYMBOLS=0 -sFORCE_FILESYSTEM"

$CC $CCFLAGS hello.c
$FC $FCFLAGS hello.f -o hello_fort.ll
emcc $ECC_FLAGS hello_fort.ll hello.ll -o hello.html