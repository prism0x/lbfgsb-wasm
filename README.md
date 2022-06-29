# L-BFGS-B in WebAssembly (Wasm)


## Install upstream LLVM

```sh
git clone https://github.com/llvm/llvm-project
mkdir llvm-project/build
cd llvm-project/build
cmake -G Ninja -DLLVM_ENABLE_PROJECTS='flang;clang;lld' -DCMAKE_BUILD_TYPE=Release  ../llvm
ninja
```