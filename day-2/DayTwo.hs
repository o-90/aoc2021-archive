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
          | fst x == "down" = go xs (fst acc, snd acc + snd x)
          | fst x == "up" = go xs (fst acc, snd acc - snd x)
          | otherwise = go xs acc

tuple2List :: Num a => (a, a) -> [a]
tuple2List (x, y) = [x, y]

-- part two
-- TODO(o-90)

main :: IO ()
main = do
  [fname] <- getArgs
  text <- readFile fname
  let ans = map ((\ [x, y] -> (x, read y :: Int)) . words) $ lines text
  let out = product . tuple2List . commands $ ans

  -- compute part one
  print out

  -- compute part two
  print "part two"
