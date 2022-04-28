{-# LANGUAGE LambdaCase #-}

module SyntacticAnalyzer where

import Common
import Data.List
import Data.List.Extra ((!?))

rules :: [(Nonterminal, Maybe [Symbol])]
rules =
  [ (XmlDokument, Just [Right Element]),
    (XmlDokument, Just [Right XmlDecl, Right Element]),
    (XmlDecl, Just [Left XmlOpenTk, Left XmlVersionTk, Right VerNumb, Left XmlCloseTk]),
    (VerNumb, Just [Right Number, Left DotTk, Right Number]),
    (Element, Just [Left SimpleStartTk, Right Name, Right ElementShitShit]),
    (ElementShitShit, Just [Left SlashedCloseTk]),
    (ElementShitShit, Just [Left SimpleCloseTk, Right ElementShit]),
    (ElementShit, Just [Right Word, Right EndTag]),
    (ElementShit, Just [Right Elements, Right EndTag]),
    (EndTag, Just [Left SlashedStartTk, Right Name, Left SimpleCloseTk]),
    (Elements, Just [Right Element]),
    (Elements, Nothing),
    (Name, Just [Left LetterTk, Right NameChars]),
    (Name, Just [Left UnderscoreTk, Right NameChars]),
    (Name, Just [Left ColonTk, Right NameChars]),
    (NameChars, Just [Right NameChar, Right NameChars]),
    (NameChars, Nothing),
    (NameChar, Just [Left LetterTk]),
    (NameChar, Just [Left DigitTk]),
    (NameChar, Just [Left DotTk]),
    (NameChar, Just [Left UnderscoreTk]),
    (NameChar, Just [Left DashTk]),
    (NameChar, Just [Left ColonTk]),
    (Number, Just [Left DigitTk, Right NumberShit]),
    (NumberShit, Just [Right Number]),
    (NumberShit, Nothing),
    (Word, Just [Right Char, Right WordShit]),
    (WordShit, Just [Right Word]),
    (WordShit, Nothing),
    (Char, Just [Left LetterTk]),
    (Char, Just [Left DigitTk]),
    (Char, Just [Left UnderscoreTk]),
    (Char, Just [Left ColonTk]),
    (Char, Just [Left DashTk])
  ]

table :: [(Nonterminal, Terminal, Int)]
table =
  [ (XmlDokument, XmlOpenTk, 2),
    (XmlDokument, SimpleStartTk, 1),
    (XmlDecl, XmlOpenTk, 3),
    (VerNumb, DigitTk, 4),
    (Element, SimpleStartTk, 5),
    (ElementShitShit, SimpleCloseTk, 7),
    (ElementShitShit, SlashedCloseTk, 6),
    (ElementShit, UnderscoreTk, 8),
    (ElementShit, ColonTk, 8),
    (ElementShit, DashTk, 8),
    (ElementShit, LetterTk, 8),
    (ElementShit, DigitTk, 8),
    (ElementShit, SimpleStartTk, 9),
    (ElementShit, SlashedStartTk, 9),
    (EndTag, SlashedStartTk, 10),
    (Elements, SimpleStartTk, 11),
    (Elements, SlashedStartTk, 12),
    (Name, LetterTk, 13),
    (Name, UnderscoreTk, 14),
    (Name, ColonTk, 15),
    (NameChars, DotTk, 16),
    (NameChars, UnderscoreTk, 16),
    (NameChars, ColonTk, 16),
    (NameChars, DashTk, 16),
    (NameChars, LetterTk, 16),
    (NameChars, DigitTk, 16),
    (NameChars, SimpleCloseTk, 17),
    (NameChars, SlashedCloseTk, 17),
    (NameChar, LetterTk, 18),
    (NameChar, DigitTk, 19),
    (NameChar, DotTk, 20),
    (NameChar, UnderscoreTk, 21),
    (NameChar, DashTk, 22),
    (NameChar, ColonTk, 23),
    (Number, DigitTk, 24),
    (NumberShit, DigitTk, 25),
    (NumberShit, DotTk, 26),
    (NumberShit, XmlCloseTk, 26),
    (Word, UnderscoreTk, 27),
    (Word, ColonTk, 27),
    (Word, DashTk, 27),
    (Word, LetterTk, 27),
    (Word, DigitTk, 27),
    (WordShit, UnderscoreTk, 28),
    (WordShit, ColonTk, 28),
    (WordShit, DashTk, 28),
    (WordShit, LetterTk, 28),
    (WordShit, DigitTk, 28),
    (WordShit, SlashedStartTk, 29),
    (Char, LetterTk, 30),
    (Char, DigitTk, 31),
    (Char, UnderscoreTk, 32),
    (Char, ColonTk, 33),
    (Char, DashTk, 34)
  ]

analyze :: [Terminal] -> (Bool, [String])
analyze input = case foldl go ([Right XmlDokument], []) input of
  ([], ss) -> (True, ss)
  (_, ss) -> (False, ss)
  where
    go :: ([Symbol], [String]) -> Terminal -> ([Symbol], [String])
    go (stack, logs) terminal =
      case stack of
        ((Right nonterminal) : xs) ->
          let maybeSymbols =
                find (matchRule nonterminal terminal) table
                  >>= (\(_, _, idx) -> pure idx)
                  >>= (rules !?)
                  >>= snd
           in case maybeSymbols of
                Just symbols ->
                  let newStack = symbols ++ xs
                   in (newStack, logs ++ ["Unfolded non terminal " <> show nonterminal <> " to " <> show symbols <> ". Current stack: " <> show newStack])
                _ -> error "No matching rules for nonterminal"
        ((Left t) : xs) ->
          if t == terminal
            then (xs, logs ++ ["Removed terminal " <> show t <> "from stack. Current stack: " <> show xs])
            else error "Wrong terminal on input"
        [] -> error "Empty stack before eof"

    matchRule :: Nonterminal -> Terminal -> (Nonterminal, Terminal, Int) -> Bool
    matchRule n1 t1 (n2, t2, _) =
      n1 == n2 && t1 == t2
