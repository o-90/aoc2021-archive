module Main where

import Data.List
import Data.Char
import Data.Bits
import System.Environment

transposeStrings :: [String] -> [String]
transposeStrings ([]:_) = []
transposeStrings x      = map head x : transposeStrings (map tail x)

getStrSum :: [Char] -> Int
getStrSum [] = 0
getStrSum xs = sum . map digitToInt $ xs

lstOfBinaryVals2Int16 :: [Int] -> Int
lstOfBinaryVals2Int16 lst = sum [x * 2 ^ y | (x, y) <- zip (reverse lst) [0 .. (length lst)]]

decodeReport :: Int -> [String] -> Int
decodeReport n report = lstOfBinaryVals2Int16 $ map (fromEnum . (> n)) (vals report)
  where
    vals = map getStrSum . transposeStrings

flipBits :: Int -> Int -> Int
flipBits n b = n `xor` mask
  where mask = 1 `shiftL` b - 1

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let report = lines text
  let n = length report `div` 2

  -- compute part one
  let val0 = decodeReport n report
  let val1 = flipBits val0 (length . head $ report)
  print $ val0 * val1

  -- compute part two
  print "part two"
