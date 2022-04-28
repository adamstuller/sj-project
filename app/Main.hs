module Main where

import LexicalAnalyzer
import SyntacticAnalyzer

main :: IO ()
main = do
  res <- readFile "input.txt"
  print $  ( fst . SyntacticAnalyzer.analyze . LexicalAnalyzer.analyze ) res