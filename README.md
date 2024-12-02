This project is designed to tokenize and format citations from a book text file (book.txt) using Lex and Yacc. It aims to take book details to check properly formatted citations of book record in three different styles: APA, MLA, and Chicago.

* Features Tokenization: Lex is used to tokenize the content from the input text, which includes book details such as author name, title, publication year, etc. 
* Parsing: Yacc processes the tokenized input and generates the required citation format based on the specified style (APA, MLA, or Chicago).
* Citation Styles Supported: APA (American Psychological Association) MLA (Modern Language Association) Chicago (Chicago Manual of Style)

## File 
* book.l - The Lex source file responsible for tokenizing the input data from book.txt.
It identifies keywords and book details in the input text. 

* book.y - The Yacc grammar file that parses the tokenized input and formats the output into citation styles (APA, MLA, and Chicago). 

* book.txt - The input text file containing book details in a defined format.

## How to Use 
* Prepare the book.txt 

Ensure that book.txt contains book details formatted according to the following structure:

L: Anderson 

I: B. 

Y: 1983 

T: Imagined communities 

S: Reflections on the origins and spread of nationalism 

P: Verso 

where 
L: Author's last name I: Author's first initial Y: Publication year T: Title of the book S: Subtitle of the book (if applicable) P: Publisher name 
* Compile Lex and Yacc Files 
```
run the following commands:

lex book.l 

yacc -d book.y gcc 

lex.yy.c book.tab.c -o citation_formatter 
```
This will create an executable citation_formatter that can process your input file.

* Run the Program To generate citations, run the program with the input file book.txt:
```
./citation_formatter book.txt 
```
The program will tokenize the book details, parse them, and print out the citation in the chosen format.
