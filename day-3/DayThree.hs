module Main where

-- import Data.List
import System.Environment
import qualified Data.ByteString as B

-- blah = concatMap ((show . fromEnum) . (> 2)) [3, 4, 6, 1, 3, 2]

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname

  -- compute part one
  print "part one"

  -- compute part two
  print "part two"
