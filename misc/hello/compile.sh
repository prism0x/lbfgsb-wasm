echo Using LLVM_PATH=$LLVM_PATH LLVM_VERSION=$LLVM_VERSION

export CC="$LLVM_PATH/bin/clang"
export CCFLAGS="-I$LLVM_PATH/lib/clang/$LLVM_VERSION/include/ -I/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/"
export LD_LIBRARY_PATH="$LLVM_PATH/lib/:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="$LLVM_PATH/lib/:$DYLD_LIBRARY_PATH"
export LDFLAGS="-L$LLVM_PATH/lib"

rm -f hello.bc hello.html hello.wasm hello.js hello_fort.ll hello.ll
$CC -cc1 -emit-llvm $CCFLAGS hello.c
flang-new -fc1 -emit-llvm hello.f -o hello_fort.ll
emcc -sWASM=1 -sFORCE_FILESYSTEM hello_fort.ll hello.ll -o hello.html