module LexicalAnalyzer where

import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import Debug.Trace (trace)

data Token
  = XmlOpenTk
  | XmlVersionTk
  | XmlCloseTk
  | DotTk
  | SimpleStartTk
  | SimpleCloseTk
  | SlashedStartTk
  | SlashedCloseTk
  | UnderscoreTk
  | ColonTk
  | DashTk
  | LetterTk
  | DigitTk
  deriving (Show)

mapping :: Map.Map String Token
mapping =
  Map.fromList $
    [ ("<?xml", XmlOpenTk),
      ("version =", XmlVersionTk),
      ("?>", XmlCloseTk),
      (".", DotTk),
      ("<", SimpleStartTk),
      (">", SimpleCloseTk),
      ("</", SlashedStartTk),
      ("_", UnderscoreTk),
      (":", ColonTk),
      ("-", DashTk)
    ]
      ++ [([c], LetterTk) | c <- ['a' .. 'z']]
      ++ [([c], LetterTk) | c <- ['A' .. 'Z']]
      ++ [(show d, DigitTk) | d <- [0 .. 9]]

findKeysForInput :: String -> [(String, Token)]
findKeysForInput input = filter (\(key, _) -> isJust $ stripPrefix input key) (Map.toList mapping)

inputContainsToken :: String -> Token -> Bool
inputContainsToken input token = undefined

analyze :: String -> [Token]
analyze input = fst $ foldl go ([], "") input
  where
    go :: ([Token], String) -> Char -> ([Token], String)
    go (tokens, acc) a =
      let newAcc = acc ++ [a]
       in case findKeysForInput newAcc of
            [] ->
              let accSufix = last newAcc
                  accPrefix = take (length newAcc - 1) newAcc
                  (suffixTokens, suffixSuffix) = go ([], "") accSufix
               in case Map.lookup accPrefix mapping of
                    Just token -> (tokens ++ [token] ++ suffixTokens, suffixSuffix)
                    Nothing -> (tokens, drop 1 newAcc) -- Dropping in case no match in tokens
            [(key, token)] -> case stripPrefix key newAcc of
              Nothing -> (tokens, newAcc)
              Just s -> (tokens ++ [token], s)
            _ -> (tokens, newAcc)
