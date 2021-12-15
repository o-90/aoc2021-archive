module Main where

import System.Environment

-- part one
type Cmd = [(String, Int)]
type Result = (Int, Int)

commands :: Cmd -> Result
commands xs = go xs (0, 0)
  where go [] acc = acc
        go (x:xs) acc
          | fst x == "forward" = go xs (fst acc + snd x, snd acc)
          | fst x == "down"    = go xs (fst acc, snd acc + snd x)
          | fst x == "up"      = go xs (fst acc, snd acc - snd x)
          | otherwise          = go xs acc

tuple2List :: Num a => (a, a) -> [a]
tuple2List (x, y) = [x, y]

-- part two
type Aim = [Int]

commands' :: Cmd -> Aim
commands' xs = go xs [0, 0, 0]
  where go [] acc = acc
        go (x:xs) acc
          | fst x == "down"    = go xs [head acc, acc !! 1, snd x + acc !! 2]
          | fst x == "up"      = go xs [head acc, acc !! 1, -snd x + acc !! 2]
          | fst x == "forward" = go xs [snd x + head acc, last acc * snd x + acc !! 1, last acc] 
          | otherwise          = go xs acc

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let cmds = map ((\ [x, y] -> (x, read y :: Int)) . words) $ lines text

  -- compute part one
  let out0 = product . tuple2List . commands $ cmds
  print out0

  -- compute part two
  let out1 = product . init . commands' $ cmds
  print out1
