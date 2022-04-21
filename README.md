# Zadanie sj

## Uloha 1

```xml
<?xml version=2.3 ?>
<simple_element/>
```

```xml
<?xml version=2.3 ?>
<hoco>
Ahoj ako mas ? 
</hoco>
```

```xml
<hoco>
<inner_element>
<simple_element/>
</inner_element>
</hoco>
```

## Uloha 2

```
" <?xml" = XML_OPEN_TK
"version =" = XML_VERSION_TK
"?>" = XML_CLOSE_TK
"." = DOT_TK
" <" = SIMPLE_START_TK
" >" = SIMPLE_CLOSE_TK
" </" = SLASHED_START_TK
"/>" = SLASHED_CLOSE_TK
"_" = UNDERSCORE_TK
" :" = COLON_TK
"-" = DASH_TK
A-Za-z = LETTER_TK
0-9 = DIGIT_TK



xmldokument -> element | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> emptyelemtag | starttag words endtag | starttag elements endtag    <-- lavy faktor: starttag
starttag -> SIMPLE_START_TK name SIMPLE_CLOSE_TK
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
words -> word words | 𝝴
elements -> element | 𝝴
emptyelemtag -> SIMPLE_START_TK name SLASHED_CLOSE_TK
name -> letter | UNDERSCORE_TK | COLON_TK | letter namechars |  UNDERSCORE_TK namechars | COLON_TK namechars  <-- lavy faktor: letter, UNDERSCORE_TK, COLON_TK
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit | digit number <-- lavy faktor: digit
digit -> DIGIT_TK
word -> char | char word <-- lavy faktor char
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)
```

## Uloha 3

### Lava faktorizacia

```

1. 

xmldokument -> element | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> emptyelemtag | starttag elementshit    
elementshit -> words endtag | elements endtag
starttag -> SIMPLE_START_TK name SIMPLE_CLOSE_TK
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
words -> word words | 𝝴
elements -> element | 𝝴
emptyelemtag -> SIMPLE_START_TK name SLASHED_CLOSE_TK
name -> letter | UNDERSCORE_TK | COLON_TK | letter namechars |  UNDERSCORE_TK namechars | COLON_TK namechars  <-- lavy faktor: letter, UNDERSCORE_TK, COLON_TK
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit | digit number <-- lavy faktor: digit
digit -> DIGIT_TK
word -> char | char word <-- lavy faktor char
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)

2. 

xmldokument -> element | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> emptyelemtag | starttag elementshit    
elementshit -> words endtag | elements endtag
starttag -> SIMPLE_START_TK name SIMPLE_CLOSE_TK
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
words -> word words | 𝝴
elements -> element | 𝝴
emptyelemtag -> SIMPLE_START_TK name SLASHED_CLOSE_TK
name -> letter nameshit | UNDERSCORE_TK nameshit | COLON_TK nameshit
nameshit -> namechars | 𝝴
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit | digit number <-- lavy faktor: digit
digit -> DIGIT_TK
word -> char | char word <-- lavy faktor char
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)

3. 

xmldokument -> element | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> emptyelemtag | starttag elementshit    
elementshit -> words endtag | elements endtag
starttag -> SIMPLE_START_TK name SIMPLE_CLOSE_TK
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
words -> word words | 𝝴
elements -> element | 𝝴
emptyelemtag -> SIMPLE_START_TK name SLASHED_CLOSE_TK
name -> letter nameshit | UNDERSCORE_TK nameshit | COLON_TK nameshit
nameshit -> namechars | 𝝴
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit numbershit
numbershit -> number | 𝝴
digit -> DIGIT_TK
word -> char | char word <-- lavy faktor char
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)


4. 

xmldokument -> element | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> emptyelemtag | starttag elementshit    
elementshit -> words endtag | elements endtag
starttag -> SIMPLE_START_TK name SIMPLE_CLOSE_TK
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
words -> word words | 𝝴
elements -> element | 𝝴
emptyelemtag -> SIMPLE_START_TK name SLASHED_CLOSE_TK
name -> letter nameshit | UNDERSCORE_TK nameshit | COLON_TK nameshit
nameshit -> namechars | 𝝴
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit numbershit
numbershit -> number | 𝝴
digit -> DIGIT_TK
word -> char  wordshit
wordshit -> word | 𝝴
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)
```

## Uloha c.4

### FIRST1

```
F1(xmldokument) = F1(element) - 𝝴 U F1(xmldecl) - 𝝴 = { SIMPLE_START_TK, XML_OPEN_TK }
F1(xmldecl) = { XML_OPEN_TK }
F1(vernumb) = F1(number) - 𝝴 = F1(digit) - 𝝴 = { DIGIT_TK }
F1(element) = F1(emptyelemtag) - 𝝴 U F1(starttag) - 𝝴 = { SIMPLE_START_TK }
F1(elementshit) = F1(words) - 𝝴 U F1(elements) - 𝝴 = { SIMPLE_START_TK, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(starttag) = { SIMPLE_START_TK }
F1(endtag) = { SLASHED_START_TK }
F1(words) = F1(word) - 𝝴 U { 𝝴 } = { 𝝴, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(elements) = F1(element) - 𝝴 U { 𝝴 } = { SIMPLE_START_TK, 𝝴 }
F1(emptyelemtag) = { SIMPLE_START_TK }
F1(name) = F1(letter) - 𝝴 U { UNDERSCORE_TK, COLON_TK } = { LETTER_TK, UNDERSCORE_TK, COLON_TK }
F1(nameshit) = F1(namechars) - 𝝴 U { 𝝴 } = { DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK} = {LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK, 𝝴 }
F1(namechars) = F1(namechar) - 𝝴 U { 𝝴 } = { DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK} = {LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK, 𝝴 }
F1(namechar) = F1(letter) - 𝝴 U F1(digit) - 𝝴 U { DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK} = {LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK}
F1(letter) = { LETTER_TK }
F1(number) = F1(digit) - 𝝴 = { DIGIT_TK }
F1(numbershit) = F1(number) - 𝝴 U { 𝝴 }  = { DIGIT_TK, 𝝴 }
F1(digit) = { DIGIT_TK }
F1(word) = F1(char) - 𝝴 = { LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(wordshit) = F1(word) - 𝝴 U { 𝝴 }  = { 𝝴, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(char) = F1(letter) - 𝝴 U F1(digit) - 𝝴 U { DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <>}  = { LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }


```