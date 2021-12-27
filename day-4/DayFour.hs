module Main where

import Data.List.Split (splitOn)
import Data.List (transpose, (\\))
import System.Environment

type Bingo = [[Int]]

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
  ""  -> []
  str -> w : wordsWhen p strp
    where (w, strp) = break p str

strToIntLst :: String -> [Int]
strToIntLst = map (\ w -> read w :: Int) . words

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let input = splitOn "\n" text
      nums = map (\ w -> read w :: Int) . wordsWhen (== ',') . head $ input
      bingo = splitOn [""] . drop 2 $ input
  print nums
  print ""
  print $ filter (/= []) . map (map strToIntLst) $ bingo
