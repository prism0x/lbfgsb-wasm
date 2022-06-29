FC = flang-new

# echo Using LLVM_PATH=$LLVM_PATH LLVM_VERSION=$LLVM_VERSION

# export CC="$LLVM_PATH/bin/clang"
# export CCFLAGS="-I$LLVM_PATH/lib/clang/$LLVM_VERSION/include/ -I/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/"
# export LD_LIBRARY_PATH="$LLVM_PATH/lib/:$LD_LIBRARY_PATH"
# export DYLD_LIBRARY_PATH="$LLVM_PATH/lib/:$DYLD_LIBRARY_PATH"
# export LDFLAGS="-L$LLVM_PATH/lib"

# rm -f hello.bc hello.html hello.wasm hello.js hello_fort.ll hello.ll
# $CC -cc1 -emit-llvm $CCFLAGS hello.c
# flang-new -fc1 -emit-llvm hello.f -o hello_fort.ll
# emcc -sWASM=1 -sFORCE_FILESYSTEM hello_fort.ll hello.ll -o hello.html

FFLAGS = -fc1 -emit-llvm

DRIVER1_77 = driver1.f
DRIVER2_77 = driver2.f
DRIVER3_77 = driver3.f

DRIVER1_90 = driver1.f90
DRIVER2_90 = driver2.f90
DRIVER3_90 = driver3.f90

LBFGSB  = lbfgsb.f
BLAS_LINPACK = linpack.f
# LINPACK = linpack.f
# BLAS    = blas.f
TIMER   = timer.f

all :  lbfgsb_77_1 lbfgsb_77_2 lbfgsb_77_3 lbfgsb_90_1 lbfgsb_90_2 lbfgsb_90_3


lbfgsb_77_1 : $(DRIVER1_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER1_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_77_1.ll

lbfgsb_77_2 : $(DRIVER2_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER2_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_77_2

lbfgsb_77_3 : $(DRIVER3_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER3_77) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_77_3

lbfgsb_90_1 : $(DRIVER1_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER1_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_90_1

lbfgsb_90_2 : $(DRIVER2_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER2_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_90_2

lbfgsb_90_3 : $(DRIVER3_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER)
	$(FC) $(FFLAGS) $(DRIVER3_90) $(LBFGSB) $(BLAS_LINPACK) $(TIMER) -o x.lbfgsb_90_3

#  cmake -G Ninja -DLLVM_ENABLE_PROJECTS='flang;clang;lld;mlir' -DFLANG_ENABLE_WERROR=On -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_TARGETS_TO_BUILD='host;wasm32;wasm64' -DLLVM_LIT_ARGS=-v -DLLVM_ENABLE_RUNTIMES="compiler-rt" -DCMAKE_BUILD_TYPE=Release  ../llvm