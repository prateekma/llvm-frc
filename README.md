# llvm-frc
This repository contains files in order to compile C++ projects to target the NI roboRIO.

## Using pre-built LLVM `libcxx`
* Clone this repository: `git clone https://github.com/prateekma/llvm-frc`. You do not need to recurse submodules.
* Call the `./frcclang++` executable within this repo to compile your programs.

For example, to compile the example `main.cpp` file into a roboRIO executable called `main`, run the following:
```shell
./frcclang++ -o main main.cpp
```

## Building `libcxx` from source
* Clone this repository with submodules: `git clone https://github.com/prateekma/llvm-frc --recurse-submodules`
* Download the full roboRIO toolchain including the gcc cross compiler here and extract it inside the root (you can replace existing files if prompted).
* Run `./build-libcxx.sh`.

## To-Do
* Remove macOS specific linker path in `build-libcxx.sh`
* Remove hardcoded path to `lld` in `frcclang++`

## Troubleshooting
* You will most likely run into an issue where `frcclang++` can't find `lld`. Please modify `frcclang++` and change the value of `-fuse-ld` to point to your LLVM linker.
