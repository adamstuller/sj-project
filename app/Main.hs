module Main where

import LexicalAnalyzer

main :: IO ()
main = do
  res <- readFile "input.txt"
  print $ analyze res