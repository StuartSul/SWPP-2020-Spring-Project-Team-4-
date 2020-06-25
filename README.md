# SWPP 2020 Spring Project (Team 4)

This is a 1-semester LLVM compiler optimization project for <Principles and Practices of Software Development> at Computer Science and Engineering Department, Seoul National University, Spring 2020.

The goal of the project was to write an (LLVM IR => assembly) compiler that is well-optimized for an awkward backend machine (mul is cheaper than add, weird stack and heap locations, and much more). Specific details are described at documents.

Our team, team 4, has achieved 2nd place in the final competition.



## How to compile and test

LLVM 10.0 (https://github.com/llvm/llvm-project) is required to compile and run, and csmith (https://github.com/csmith-project/csmith) required to run certain test scripts. After LLVM 10.0 is successfully built, please run following to compile:

```
./configure.sh <LLVM bin dir (ex: ~/llvm-10.0-releaseassert/bin)>
make
```

To run FileCheck and Google Test:

```
make test
```

To run all the test input LLVM IR's, appropriately change directories in test.sh and run:

```
/bin/bash test.sh
```

To run csmith test, appropriately change directories in csmith.sh and run:

```
/bin/bash csmith.sh
```



## How to run

Compile LLVM IR `input.ll` into an assembly `output.s` using this command:

```
./sf-compiler input.ll -o output.s
```

To see the IR that has registers depromoted before emitting assembly, please run:

```
./sf-compiler input.ll -o output.s -print-depromoted-module
```

To run the output assembly, compile the interpreter and run:

```
./sf-interpreter output.s
```

The costs of running the assembly will be recorded at `sf-interpreter.log`

