module Main where

import Data.List
import Control.Monad (replicateM)
import System.Environment

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
  "" -> []
  s' -> w : wordsWhen p s''
    where (w, s'') = break p s'

main :: IO ()
main = do
  text <- getLine
  print $ map (\ w -> read w :: Int) . wordsWhen (== ',') $ text
  block <- replicateM 6 getLine
  let arr_n = map (map (\ w -> read w :: Int) . words) . tail $ block
  let arr_t = transpose arr_n
  print arr_n
  print arr_t
