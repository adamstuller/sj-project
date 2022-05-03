module Main where

import Control.Monad (join)
import Data.List (intersperse)
import LexicalAnalyzer
import SyntacticAnalyzer

main :: IO ()
main = do
  res <- readFile "input.txt"
  let (result, logs) = (SyntacticAnalyzer.analyze . LexicalAnalyzer.analyze) res
  print $ "Finished with result: " <> show result
  mapM_ (\(num, log) -> putStrLn (show num <> ". " <> log)) (zip [1 ..] logs)
