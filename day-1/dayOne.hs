module Main where

import System.Environment

-- part one
findDepth :: [Int] -> Int
findDepth depths = sum [1 | (x, y) <- zip depths (tail depths), x < y]

-- part two
window :: Int -> [Int] -> [[Int]]
window _ [] = []
window size ls@(_:xs)
  | length ls >= size = take size ls : window size xs
  | otherwise         = window size xs

findDepth' :: [[Int]] -> Int
findDepth' depths = sum [1 | (x, y) <- zip depths (tail depths), sum x < sum y]

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname

  -- compute part one
  let nums = map (\ n -> read n :: Int) . words $ text
  let ans0 = findDepth nums
  print ans0

  -- compute part two
  let depths = window 3 nums
  let ans1 = findDepth' depths
  print ans1
