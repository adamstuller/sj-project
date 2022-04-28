module Common where

data Terminal
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
  deriving (Show, Eq)

data Nonterminal
  = XmlDokument
  | XmlDecl
  | VerNumb
  | Element
  | ElementShitShit
  | ElementShit
  | EndTag
  | Elements
  | Name
  | NameChars
  | NameChar
  | Number
  | NumberShit
  | Word
  | WordShit
  | Char
  deriving Eq

type Symbol = Either Terminal Nonterminal
