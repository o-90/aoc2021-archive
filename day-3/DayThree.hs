module Main where

import Data.List
import Data.Char
import Data.Bits
import System.Environment

type LBits = [String]

transposeStrings :: LBits -> LBits
transposeStrings ([]:_) = []
transposeStrings x      = map head x : transposeStrings (map tail x)

getStrSum :: [Char] -> Int
getStrSum [] = 0
getStrSum xs = sum . map digitToInt $ xs

-- this could be better; use `iterate`
lstOfBinaryVals2Int16 :: [Int] -> Int
lstOfBinaryVals2Int16 lst = sum [x * 2 ^ y | (x, y) <- zip (reverse lst) [0 .. (length lst)]]

binStr2Int :: LBits -> Int
binStr2Int = lstOfBinaryVals2Int16 . map digitToInt . unwords

decodeReport :: Int -> LBits -> Int
decodeReport n report = lstOfBinaryVals2Int16 $ map (fromEnum . (> n)) (vals report)
  where
    vals = map getStrSum . transposeStrings

flipBits :: Int -> Int -> Int
flipBits n b = n `xor` mask
  where mask = 1 `shiftL` b - 1

-- [["00010","00100","00111","01010","01111"],["10000","10101","10110","10111","11001","11100","11110"]]

-- ---------------------------------------------------------------------------
-- It seems like these two functions could be combined but I don't know
-- enough about haskell to abstract this yet.
customGetMin :: Int -> [LBits] -> LBits
customGetMin n l = case l of
  [x, y]
    | length x < length y -> x
    | length x > length y -> y
    | otherwise           -> if head x!!n == '0' then x else y
  [x] -> x
  _ -> []

customGetMax :: Int -> [LBits] -> LBits
customGetMax n l = case l of
  [x, y]
    | length x > length y -> x
    | length x < length y -> y
    | otherwise           -> if head x!!n == '1' then x else y
  [x] -> x
  _ -> []
-- ---------------------------------------------------------------------------

{-
decodeRating :: (Int -> [LBits] -> LBits) -> LBits -> Int -> LBits
decodeRating f xs nBits = go 0 xs
  where go acc xs
          | acc == nBits = xs
          | otherwise    = go (acc + 1) (decode (acc + 1) xs)
        decode n = f n . subset
          where subset = groupBy (\ x y -> x!!n == y!!n) . sort

-}
decodeRating :: Int -> LBits -> LBits
decodeRating nBits xs = go 0 xs
  where go acc xs
          | acc == nBits = xs
          | otherwise    = go (acc + 1) (decode (acc + 1) xs)
        decode n l = customGetMax n (groupBy (\ x y -> x!!n == y!!n) . sort $ l)

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let report = lines text
  let n = length report `div` 2
  let bits = length . head $ report

  -- compute part one
  let val0 = decodeReport n report
  let val1 = flipBits val0 bits
  print $ val0 * val1

  -- compute part two
  print $ decodeRating 1 report
