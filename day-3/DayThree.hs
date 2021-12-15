module Main where

-- import Data.List
import System.Environment
import Data.Char

transposeStrings :: [String] -> [String]
transposeStrings ([]:_) = []
transposeStrings x      = map head x : transposeStrings (map tail x)

getStrSum :: [Char] -> Int
getStrSum [] = 0
getStrSum xs = sum . map digitToInt $ xs

lstOfBinaryVals2Int16 :: [Int] -> Int
lstOfBinaryVals2Int16 lst = sum [x * 2 ^ y | (x, y) <- zip (reverse lst) [0 .. (length lst)]]

-- need to figure out a way efficiently create the list [1, 0, 1, 0, 1]
-- and [0, 1, 0, 1, 0] at the same time. This currently only creates the
-- first one.  Maybe using `(>>=)` ?
decodeReport :: Int -> [String] -> Int
decodeReport n report = lstOfBinaryVals2Int16 $ map (fromEnum . (> n)) (vals report)
  where
    vals = map getStrSum . transposeStrings

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let report = lines text
  let n = length report `div` 2

  -- compute part one
  print $ decodeReport n report

  -- compute part two
  print "part two"
