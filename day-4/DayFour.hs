module Main where

import System.Environment


main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname

  -- compute part one
  print "part one"

  -- compute part two
  print "part two"
