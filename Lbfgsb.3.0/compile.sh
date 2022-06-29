echo Using LLVM_PATH=$LLVM_PATH LLVM_VERSION=$LLVM_VERSION

export CC="$LLVM_PATH/bin/clang"
export CCFLAGS="-I$LLVM_PATH/lib/clang/$LLVM_VERSION/include/ -I/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/"
export LD_LIBRARY_PATH="$LLVM_PATH/lib/:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="$LLVM_PATH/lib/:$DYLD_LIBRARY_PATH"
export LDFLAGS="-L$LLVM_PATH/lib"

rm -f *.ll *.html *.wasm *.js
flang-new -fc1 -emit-llvm blas_linpack.f -o blas_linpack.ll
flang-new -fc1 -emit-llvm timer.f -o timer.ll
flang-new -fc1 -emit-llvm lbfgsb.f -o lbfgsb.ll

flang-new -fc1 -emit-llvm driver1.f -o driver1.ll
emcc -sWASM=1 -sFORCE_FILESYSTEM blas_linpack.ll timer.ll lbfgsb.ll driver1.ll -o driver1.html

flang-new -fc1 -emit-llvm driver2.f -o driver2.ll
emcc -sWASM=1 -sFORCE_FILESYSTEM blas_linpack.ll timer.ll lbfgsb.ll driver2.ll -o driver2.html

flang-new -fc1 -emit-llvm driver3.f -o driver3.ll
emcc -sWASM=1 -sFORCE_FILESYSTEM blas_linpack.ll timer.ll lbfgsb.ll driver3.ll -o driver3.html
