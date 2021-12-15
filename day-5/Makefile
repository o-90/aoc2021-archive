SHELL := /bin/bash

GHC := ghc
GHC_FLAGS := -O1
BIN := run
SRC := DayFive.hs

build:
	$(GHC) $(GHC_FLAGS) -o $(BIN) $(SRC)

clean:
	rm *.hi || true
	rm *.o || true
	rm run || true
