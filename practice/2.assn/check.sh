#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "check.sh <clang path>"
  echo "(ex: check.sh my-llvm-release/bin/clang)"
  exit 1
fi

set -e
$1 -isysroot/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk main.c count.ll -o a.out

for i in {1..6} ; do
  ./a.out input${i}.txt > tmp.txt
  diff tmp.txt output${i}.txt
done
