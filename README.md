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

5.  -vyhodenie nemashit

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
name -> letter namechars | UNDERSCORE_TK namechars | COLON_TK namechars
namechars -> namechar namechars | 𝝴
namechar -> letter | digit | DOT_TK | UNDERSCORE_TK | DASH_TK | COLON_TK
letter -> LETTER_TK
number -> digit numbershit
numbershit -> number | 𝝴
digit -> DIGIT_TK
word -> char  wordshit
wordshit -> word | 𝝴
char -> letter | digit | UNDERSCORE_TK | COLON_TK | DASH_TK ... (okrem <>)
 
6. dalsie upravy
 - vyhodili sme neterminaly, ktore idu do jedneho terminalu digit, letter...)
 -  vytiahli sme SIMPLE_START_TK pomocou elementshitshit
 - vyhodili sme uplne words neterminal

xmldokument -> element 
            | xmldecl element
xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
vernumb -> number DOT_TK number
element -> SIMPLE_START_TK name elementshitshit
elementshitshit ->  SLASHED_CLOSE_TK 
            | SIMPLE_CLOSE_TK elementshit
elementshit -> word endtag
            | elements endtag
endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
elements -> element 
            | 𝝴
name -> LETTER_TK namechars 
            | UNDERSCORE_TK namechars 
            | COLON_TK namechars
namechars -> namechar namechars 
            | 𝝴
namechar -> LETTER_TK 
            | DIGIT_TK 
            | DOT_TK 
            | UNDERSCORE_TK 
            | DASH_TK 
            | COLON_TK
number -> DIGIT_TK numbershit
numbershit -> number 
            | 𝝴
word -> char wordshit
wordshit -> word 
            | 𝝴
char -> LETTER_TK 
            | DIGIT_TK 
            | UNDERSCORE_TK 
            | COLON_TK 
            | DASH_TK
```
## Uloha c.4

### FIRST1

```

povodny f1
F1(xmldokument) = F1(element) - 𝝴 U F1(xmldecl) - 𝝴 = { SIMPLE_START_TK, XML_OPEN_TK }
F1(xmldecl) = { XML_OPEN_TK }
F1(vernumb) = F1(number) - 𝝴 = F1(digit) - 𝝴 = { DIGIT_TK }
F1(element) = F1(emptyelemtag) - 𝝴 U F1(starttag) - 𝝴 = {  SIMPLE_START_TK }
F1(elementshit) = F1(words) - 𝝴 U F1(elements) - 𝝴 U F1(endtag) = { SIMPLE_START_TK, SLASHED_START_TK, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
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

f1 po uprave (the true wan)

F1(xmldokument) = F1(element) -  𝝴  U F1(xmldecl) - 𝝴 = { XML_OPEN_TK, SIMPLE_START_TK }
F1(xmldecl) =  { XML_OPEN_TK }
F1(vernumb) = F1(number) - 𝝴  = { DIGIT_TK }
F1(element) = { SIMPLE_START_TK }
F1(elementshitshit) = { SLASHED_CLOSE_TK, SIMPLE_CLOSE_TK }
F1(elementshit) = F1(word) - 𝝴  U F1(elements) - 𝝴 U F1(endtag) = { SLASHED_START_TK, SIMPLE_START_TK, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(endtag) = { SLASHED_START_TK }
F1(elements) = F1(element) - 𝝴 U { 𝝴 } = { SIMPLE_START_TK, 𝝴 }
F1(name) = { LETTER_TK, UNDERSCORE_TK, COLON_TK }
F1(namechars) = F1(namechar) - 𝝴 U { 𝝴 } = { 𝝴, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(namechar) = { LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK  ... okrem <>  }
F1(number) = { DIGIT_TK }
F1(numbershit) = F1(number) - 𝝴 U { 𝝴 }  = { DIGIT_TK, 𝝴 }
F1(word) = F1(char) - 𝝴 = { LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(wordshit) = F1(word) U { 𝝴 } = { 𝝴, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
F1(char) = { LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }


```

### FOLLOW1
```
FO1(xmldokument) = { $ }
FO1(xmldecl) = F1(element) - 𝝴 = { SIMPLE_START_TK }
FO1(vernum) = { XML_CLOSE_TK }
FO1(element) = FO1(xmldokument) U FO1(elements) = { $, SLASHED_START_TK } 
FO1(elementshitshit) = FO1(element) = { $, SLASHED_START_TK } 
FO1(elementshit) = FO1(elementshitshit) = { $, SLASHED_START_TK } 
FO1(endtag) = FO1(elementshit) = { $, SLASHED_START_TK } 
FO1(elements) = F1(endtag) - 𝝴 = { SLASHED_START_TK }
FO1(name) = { SIMPLE_CLOSE_TK } U F1(elementshitshit) - 𝝴 = { SLASHED_CLOSE_TK, SIMPLE_CLOSE_TK }
FO1(namechars) = FO1(name) = { SLASHED_CLOSE_TK, SIMPLE_CLOSE_TK }
FO1(namechar) = F1(namechars) - 𝝴 U FO1(namechars) = { SLASHED_CLOSE_TK, SIMPLE_CLOSE_TK, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
FO1(number) = FO1(numbershit) U { DOT_TK } U FO1(vernumb) = { DOT_TK, XML_CLOSE_TK }
FO1(numbershit) = FO1(number) = { DOT_TK, XML_CLOSE_TK }
FO1(word) = FO1(wordshit) U F1(endtag) - 𝝴 = { SLASHED_START_TK }
FO1(wordshit) = FO1(word) = { SLASHED_START_TK }
FO1(char) = F1(wordshit) - 𝝴 U FO1(word) =  { SLASHED_START_TK, LETTER_TK, DIGIT_TK, DOT_TK, UNDERSCORE_TK, DASH_TK, COLON_TK ... okrem <> }
```

Je to LL!
## 5. Tabulka prechodov

```
1. xmldokument -> element 
2. xmldokument -> xmldecl element
3. xmldecl -> XML_OPEN_TK XML_VERSION_TK vernumb XML_CLOSE_TK
4. vernumb -> number DOT_TK number
5. element -> SIMPLE_START_TK name elementshitshit
6. elementshitshit ->  SLASHED_CLOSE_TK 
7. elementshitshit ->  SIMPLE_CLOSE_TK elementshit
8. elementshit -> word endtag
9. elementshit -> elements endtag
10. endtag -> SLASHED_START_TK name SIMPLE_CLOSE_TK
11. elements -> element 
12. elements -> 𝝴
13. name -> LETTER_TK namechars 
14. name -> UNDERSCORE_TK namechars 
15. name -> COLON_TK namechars
16. namechars -> namechar namechars 
17. namechars -> 𝝴
18. namechar -> LETTER_TK 
19. namechar -> DIGIT_TK 
20. namechar -> DOT_TK 
21. namechar -> UNDERSCORE_TK 
22. namechar -> DASH_TK 
23. namechar -> COLON_TK
24. number -> DIGIT_TK numbershit
25. numbershit -> number 
26. numbershit -> 𝝴
27. word -> char wordshit
28. wordshit -> word 
29. wordshit -> 𝝴
30. char -> LETTER_TK 
31. char -> DIGIT_TK 
32. char -> UNDERSCORE_TK 
33. char -> COLON_TK 
34. char -> DASH_TK
```


