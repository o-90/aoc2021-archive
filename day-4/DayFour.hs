module Main where

import Data.List
import Control.Monad (replicateM)
import System.Environment

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
  ""  -> []
  str -> w : wordsWhen p strp
    where (w, strp) = break p str

main :: IO ()
main = do
  text <- getLine
  print $ map (\ w -> read w :: Int) . wordsWhen (== ',') $ text
  block <- replicateM 6 getLine
  let arr_n = map (map (\ w -> read w :: Int) . words) . tail $ block
  let arr_t = transpose arr_n
  print arr_n
  print arr_t
