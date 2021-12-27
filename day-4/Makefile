SHELL := /bin/bash

GHC := ghc
GHC_FLAGS := -O1
BIN := run
SRC := DayFour.hs

build:
	cabal build

run-example:
	./dist-newstyle/build/x86_64-linux/ghc-8.10.7/dayfour-0.0.1.0/x/run/build/run/run example_test_cases.in

run-actual:
	./dist-newstyle/build/x86_64-linux/ghc-8.10.7/dayfour-0.0.1.0/x/run/build/run/run actual_test_cases.in

clean:
	rm -rf dist-newstyle/ || true
