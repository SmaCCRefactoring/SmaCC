SmaCC: The Smalltalk Compiler-Compiler 
from John Brant and Don Roberts
(http://www.refactory.com/Software/SmaCC)

Tutorial

This is a walk-through tutorial to demonstrate many of the features of SmaCC, the Smalltalk Compiler Compiler. In this example, we will incrementally develop a simple calculator. 

Our first calculator is going to be relatively simple. It is going to take two  numbers  and add them together. To start things off, we have to tell the scanner how to recognize a  number. It starts with one or more digits, possibly followed by an decimal point with zero or more digits after it. The scanner definition for this token is: 
<number>        :       [0-9]+ (\. [0-9]*) ? ; 

Enter that line into the scanner tab on the interface. Let's go over each part: 

<number> 

Names the token. The name inside the <> must be a legal Smalltalk variable name. 

:

Separates the name of the token from the token's definition. 

[0-9] 

Matches any single character in the range '0' to '9' (a digit). 

+

Matches the previous expression  one or more times. In this case, we are matching one or more digits. 

( ... ) 

Groups subexpressions. 

\. 

Matches the '.' character (. has a special meaning in regular expressions, \ quotes it). 

*

Matches the previous expression zero or more times. 

?

Matches the previous expression  zero or one time (i.e., it is optional). 

;

Terminates a token specification. 

We don't want to have to worry about whitespace in our language, so we need to define what a whitespace is and to ignore it. To do this, enter the following token specification on the next line on the scanner page: 
<whitespace>    :       \s+; 

\s matches any whitespace character (space, tab, linefeed, etc.). So how do  we tell the scanner to ignore it? If you look in the SmaCCScanner class, you will find a method named 'whitespace'. If a scanner understands a method that has the same name as a token name, that method will get called whenever the scanner matches that kind of token. As you can see, the whitespace method eats whitespace. There is also a 'comment' method that behaves similarly. 

The only other token that will appear in our system would be the '+' token for addition. However, since this is token is always the same, we don't have to tell the scanner what it looks like. It will figure it out from our grammar. 

Speaking of our grammar, let's go ahead and define it. Enter the following specification in the Parser tab: 
Expression : 
          Expression "+" Number
        | Number ;
Number : <number>; 

This basically says that an expressions is either a number  or an expression added to a number. 

We should be able to compile a parser now. Switch to the Compile tab. You need to enter the class name for both  the scanner and parser. Use CalculatorScanner and CalculatorParser respectively.  Once the class names are entered, we are ready to compile the parser. Press the  'Compile LALR(1)' button (you should always push this one unless you know what  you are doing. Basically, it will generate smaller parsers than the other  option). This will create new Smalltalk classes for the CalculatorScanner and  CalculatorParser and compile several methods in those classes. All methods that  SmaCC compiles will go into a "generated-*" method protocol. You should not  change those methods since they are replace each time you compile. 

Whenever SmaCC creates new classes, they are compiled in the default application/package. If you are using VisualAge,  you will need to make sure that the default application is an open edition and  that it prereqs the SmaCCRuntime application. 

If you have already created the scanner and parser classes, you can load their  definitions by using the "..." buttons next to the class name entry fields. If  you answer "Yes" to the dialog, the text in the scanner/parser tabs will be  replaced with the definition that was last compiled (assuming that the "Generate  definition comments" was checked during the last compile). 

Now we are ready to test our parser. Go to the test pane, enter 3 + 4, and press the parse button; you will see that the parser correctly parses it. If you press Parse and Inspect you will see and inspector on an OrderedCollection that contains the parsed tokens. This is because we haven't specified what the parser is supposed to do when it parses. You can also enter incorrect  items. For example, try to parse "3 + + 4" or "3 + a". An  error message should appear in the text. 

Now we need to define the actions that need to happen when we parse our  expressions. Currently, our parser is just validating that the expression is a  bunch of numbers added together. Generally, you will create some structure that  represents what you've parsed (e.g., a parse tree). However, in this case, we  are not concerned about the structure, but we are concerned about the result  (the value of the expression). For our example, you need to modify the grammar  definition to be: 
Expression : 
          Expression "+" Number {'1' + '3'} | Number {'1'} ;
Number : <number> {'1' value asNumber} ;

The text between the braces is Smalltalk code that gets evaluated when the rule is applied. Strings with a number get replaced with the corresponding parse node. In the first Expression rule, the '1' will get replaced by the ParseNode that matches Expression and the '3' gets replaced by the ParseNode that matches Number. The second item in the rule is the "+" token. Since we already know what  it is, it is not interesting. Compile the new parser. Now when you do a 'Parse  and Inspect' from the test pane, you should see the result: 7. 

One problem with the previous code is that if you need to change a rule then you  may also need to change the code for that rule. For example, suppose you  inserted a new token at the beginning of a rule, then you would need to change  all of your references in the Smalltalk code. We can alleviate this problem by  using named expressions. After each part of a rule, we can specify its name.  Names are specified with single quotes and must be legal Smalltalk variable  names. Doing this for our grammar we get: 
Expression : 
          Expression 'expression' "+" Number 'number' {expression + number} | Number 'number' {number} ;
Number : <number> 'numberToken' {numberToken value asNumber} ;

While this will result in the same language being parsed, it makes it easier  to maintain your parsers. Let's extend our language to add subtraction. Here's the new grammar: 
Expression : 
          Expression 'expression' "+" Number 'number' {expression + number} | Expression 'expression' "-" Number 'number' {expression - number} | Number 'number' {number};
Number : <number> 'numberToken' {numberToken value asNumber}; 

After you've compiled this, '3 + 4 - 2 ' should return '5'. Next, let's add multiplication and division: 
Expression : 
          Expression 'expression' "+" Number 'number' {expression + number}
        | Expression 'expression' "-" Number 'number' {expression - number} | Expression 'expression' "*" Number 'number' {expression * number}
        | Expression 'expression' "/" Number 'number' {expression / number} | Number 'number' {number};
Number : <number> 'numberToken' {numberToken value asNumber}; 

Here we run into a problem. If you evaluate '2 + 3 * 4' you end up with 20. The problem is that in standard mathematics, multiplication has a higher precedence than addition. Our grammar evaluates strictly left-to-right. The standard solution for this problem is to define additional nonterminals to force the sequence of evaluation. Our grammar with that solution would look like: 
Expression : 
          Term 'term' {term}
        | Expression 'expression' "+" Term 'term' {expression + term}
        | Expression 'expression' "-" Term 'term' {expression - term};
Term : 
          Number 'number' {number}
        | Term 'term' "*" Number 'number' {term * number}
        | Term 'term' "/" Number 'number' {term / number};
Number : <number> 'numberToken' {numberToken value asNumber}; 

If you compile this grammar, you will see that '2 + 3 * 4' evaluates to 14 like we would expect. Now, as you can imagine, this gets pretty complicated as the number of precedence rules increases (e.g., C). We can use ambiguous grammars and precedence rules to simplify this situation. Here is the same grammar using precedence to enforce our evaluation order: 
%left "+" "-";
%left "*" "/"; Expression : 
          Expression 'exp1' "+" Expression 'exp2' {exp1 + exp2} | Expression 'exp1' "-" Expression 'exp2' {exp1 - exp2} | Expression 'exp1' "*" Expression 'exp2' {exp1 * exp2} | Expression 'exp1' "/" Expression 'exp2' {exp1 / exp2} | Number 'number' {number};
Number : <number> 'numberToken' {numberToken value asNumber}; 

Notice that we changed the grammar so that there are Expressions on both sides  of the operator.  The two lines that we added to the top of the grammar mean that + and - are evaluated left-to-right and have the same precedence, which is lower than * and /. Likewise, the second line means that * and / have equal precedence.  Grammars in this form are usually much more intuitive, especially in cases with many precedence levels. Just as an example, let's add exponentiation and parentheses: 
%left "+" "-";
%left "*" "/"; %right "^"; Expression : 
          Expression 'exp1' "+" Expression 'exp2' {exp1 + exp2}
        | Expression 'exp1' "-" Expression 'exp2' {exp1 - exp2}
        | Expression 'exp1' "*" Expression 'exp2' {exp1 * exp2}
        | Expression 'exp1' "/" Expression 'exp2' {exp1 / exp2} | Expression 'exp1' "^" Expression 'exp2' {exp1 raisedTo: exp2} | "(" Expression 'expression' ")" {expression} | Number 'number' {number};
Number : <number> 'numberToken' {numberToken value asNumber}; 

Once you have compiled the grammar, you will be able to evaluate '3 + 4 * 5 ^ 2  ^ 2' to get 2503. Since the exponent operator is right associative, this  expression is evaluated like 3 + (4 * (5 ^ (2 ^ 2))). We can also evaluate  expressions with parentheses. For example, evaluating '(3 + 4) * (5 - 2) ^ 3'  results in 189. 

The Scanner

Scanning takes an input stream of characters and converts that into a stream of tokens. The tokens are then passed on to the parsing phase. 

The scanner is specified by a collection of token specifications. Each token is specified by: 
    TokenName    :    RegularExpression ;

TokenName is a valid Smalltalk variable name that is surrounded by <>. For example, "<token>" is a valid TokenName, but "<token name>" is not since "token name" isn't a valid Smalltalk variable name. The RegularExpression is a regular expression that matches a token. It should match one or more characters in the input stream. The colon character, ":", is used to separate the TokenName and the RegularExpression, and the semicolon character, ";", is used to terminate the token specification. 


Regular Expression Syntax

While the rules are specified as regular expressions, there are many different syntaxes for regular expressions. We choose a relatively simple syntax that is specified below. If you wish to have a more rich syntax, you can modify the scanner's parser: SmaCCScannerScanner & SmaCCScannerParser. These classes were created using SmaCC. 
\character Matches a special character. The character immediately following the backslash is matched exactly, unless it is a letter. Backslash-letter combinations have other meanings and are specified below. 
\cLetter Matches a control character. Control characters are the first 26 characters (e.g., \cA equals "Character value: 0"). The letter that follows the "\c" must be an uppercase letter. 
\d Matches a digit, 0-9. 
\D Matches anything that is not a digit. 
\f Matches a form-feed character, "Character value: 12". 
\n Matches a newline character, "Character value: 10". 
\r Matches a carriage return character, "Character value: 13". 
\s Matches any whitespace character, [ \f\n\r\t\v]. 
\S Matches any non-whitespace character. 
\t Matches a tab, "Character value: 9". 
\v Matches a vertical tab, "Character value: 11" 
\w Matches any letter, number or underscore, [A-Za-z0-9_]. 
\W Matches anything that is not a letter, number or underscore. 
\xHexNumber Matches a character specified by the hex number following the "\x". The hex number must be at least one character long and no more than four characters for Unicode characters and two characters for non-Unicode characters. For example, "\x20" matches the space character (Character value: 16r20), and "\x1FFF" matches "Character value: 16r1FFF". 
<token> Copies the definition of <token> into the current regular expression. For example, if we have "<hexdigit> : \d | [A-F] ;", we can use <hexdigit> in a later rule: "<hexnumber> : <hexdigit> + ;". 
[characters] Matches one of the characters inside the []. This is a shortcut for the "|" operator. In addition to single characters, you can also specify character ranges with the "-" character. For example, "[a-z]" matches any lower case letter. 
[^characters] Matches any character not listed in the characters block. "[^a]" matches anything except for "a". 
# comment Creates a comment that is ignored by SmaCC. Everything from the # to the end of the line is ignored. 
exp1| exp2 Matches either exp1 or exp2. 
exp1 exp2 Matches exp1 followed by exp2. "\d \d" matches two digits. 
exp* Matches exp zero or more times. "0*" matches "" and "000". 
exp? Matches exp zero or one time. "0?" matches only "" or "0". 
exp+ Matches exp one or more times. "0+" matches "0" and "000", but not "". 
exp{min,max} Matches exp at least min times but no more than max times. "0{1,2}" matches only "0" or "00". It does not match "" or "000". 
(exp) Groups exp for precedence. For example, "(a b)*" matches "ababab". Without the parentheses, "a b *" would match "abbbb" but not "ababab". 

Since there are multiple ways to combine expressions, we need precedence rules for their combination. The or operator, "|", has the lowest precedence and the "*", "?", "+", and "{,}" operators have the highest precedence. For example, "a | b c *" matches "a" or "bcccc", but not "accc" or "bcbcbc". If you wish to match "a" or "b" followed by any number of c's, you need to use "(a | b) c *". 


Overlapping Tokens

Unlike T-Gen, SmaCC can handle overlapping tokens with any problems. For example, the following is a legal SmaCC scanner definition: 
	<variable>	: [a-zA-Z] \w* ;
	<any_character>	: . ;
This definition will match a variable or a single character. A variable can also be a single character [a-zA-Z], so the two tokens overlap. SmaCC handles overlapping characters by preferring the first token specified by the grammar. For example, an "a" could be a <variable> or an <any_character> token, but since <variable> is specified first, SmaCC will use it. 


Matching Methods

If your scanner has a method name that matches the name of the token, (e.g. whitespace), that method will get called upon a match of that type. The SmaCCScanner superclass already has a default implementation of #whitespace and #comment. These methods ignore those tokens by default. Matching methods can also be used to handle overlapping token classes. For example, in the C grammar, a type definition is the same as an identifier. The only way that they can be disambiguated is by looking up the name in the type table. In our example C parser, we have an IDENTIFIER method that is used to determine whether the token is really an IDENTIFIER or whether it is a TYPE_NAME. 


Unreferenced Tokens

If a token is not referenced from a grammar specification, it will not be included in the generated scanner, unless the token's name is also a name of a method (see previous section). This, coupled with the ability to do substitutions, allows you to have the equivalent of macros within your scanner specification. However, be aware that if you are simply trying to generate a scanner, you will have to make sure that you create a dummy parser specification that references all of the tokens that you want in the final scanner. 


Case Insensitive Scanning

You can specify that the scanner should ignore case differences by checking the "Ignore Case" option on the compile tab. If you have a language that is case insensitive and has several keywords, this can be a handy feature to have. For example, if you have "THEN" as a keyword in a case insensitive language, you would need to specify a token for then as "<then> : [tT] [hH] [eE] [nN] ;". This is a pain to enter correctly. When the ignore case option is checked, SmaCC will automatically convert "THEN" into "[tT][hH][eE][nN]". 


Unicode Characters

SmaCC compiles the scanner into a bunch of conditional tests on characters. Normally, it assumes that characters have values between 0 and 255, and it can make some optimizations based on this fact. With the "Allow Unicode Characters" option checked, it will assume that characters have values between 0 and 65535. 

The Parser
Parsing converts the stream of tokens provided by the scanner into some object. Normally, this object will be a parse tree, but it does not have to be a parse tree. For example, the SmaCC tutorial shows a calculator. This calculator does not produce a parse tree; it produces the result, a number. 

In SmaCC the parser is defined by the grammar specification entered in the 'Parser' tab. The grammar specification has two parts, an optional directives section and the production rules. The directives section is used to tell SmaCC how to handle ambiguous grammars as well as how it should generate the code for the parser. The production rules section contains the grammar for the parser and the code that executes when a production rule is matched. 


Directives

The optional directives section consists of a set of directives. The system currently has 5 directives. Each directive begins with a "%" character and the directive keyword, then lists a set of symbols, and finally ends with the semicolon character, ";". 


Ambiguous Grammars and Precedence

SmaCC can handle ambiguous grammars. Given an ambiguous grammar, SmaCC will produce some parser. However, it may not parse correctly. For an LR parser, there are two basic types of ambiguities, reduce/reduce conflicts and shift/reduce conflicts. Reduce/reduce conflicts are bad. SmaCC has no directives to handle them and just picks one of the choices. These conflicts normally require a rewrite of your grammar. 

On the other hand, shift/reduce conflicts can be handled by SmaCC without rewriting your grammar. When SmaCC encounters a shift/reduce conflict it will perform the shift action by default. However, you can control this action with the "%left", "%right", and "%nonassoc" directives. If a token has been declared in a "%left" directive, it means that the token is left-associative. Therefore, the parser will perform a reduce operation. However, if it has been declared as right-associative, it will perform a shift operation. A token defined as %nonassoc will produce an error if that is encountered during parsing. For example, you may want to specify that the equal operator, "=", is non-associative, so "a = b = c" is not parsed as a valid expression. All three directives are followed by a list of tokens. 

Additionally, the %left, %right, and %nonassoc directives allow precedence to be specified. The order of the directives specifies the precedence of the tokens. The higher precedence tokens appear on the higher line numbers. For example, the following directive section gives the precedence for the simple calculator in our tutorial: 
%left "+" "-";
%left "*" "/";
%right "^";
The "+" and "-" symbols appear on the first line and have the lowest precedence. They are also left-associative so "1 + 2 +3" will be evaluated as "(1 + 2) + 3". On the next line are the "*" and "/" symbols. Since they appear on a higher line number, they have higher precedence than the "+" and "-". Finally, on line three we have the "^" symbol. It has the highest precedence. Combining all the rules allows us to parse "1 + 2 * 3 / 4 ^ 2 ^ 3" as "1 + ((2 * 3) / (4 ^ (2 ^ 3)))". 


Start Symbols

By default, the left-hand side of the first grammar rule is the start symbol. If you want to multiple start symbols, then you can specify them by using the "%start" directive followed by the nonterminals that are additional start symbols. This is useful for creating two parsers with two grammars that are similar but slightly different. For example, consider a Smalltalk parser. You can parse methods, and you can parse expressions. These are two different operations, but have very similar grammars. Instead of creating two different parsers for parsing methods and expressions, we can specify one grammar that parses methods and also specify another starting position for parsing expressions. The StParser in the SmaCC Example Parsers package has an example of this. The StParser class>>parseMethod: uses the #startingStateForMethod position to parse methods and the StParser class>>parseExpression: uses the #startingStateForSequenceNode position to parse expressions. 


Id Methods

Internally, the various token types are represented as integers. However, there are times that you need to reference the various token types. For example, in the CScanner and CParser classes, the TYPE_NAME token is identical to the IDENTIFIER token. The IDENTIFIER matching method does a lookup in the type table and if it finds a type definition with the same name as the current IDENTIFIER, it want to return the TYPE_NAME token type. To determine what integer this is, the parser was created with an %id directive for <IDENTIFIER> and <TYPE_NAME>. This generates the IDENTIFIERId and TYPE_NAMEId methods on the scanner. These methods simply return the number representing that token type. See the C sample scanner and parser for a good example of how this is used. 


Production Rules

The production rules contains the grammar for the parser. The first production rule is considered to be the starting rule for the parser. Each production rule consists of a non-terminal symbol name followed by a ":" separator which is followed by a list of possible productions separated by vertical bar, "|", and finally terminated by a semicolon, ";". 

Each production consists of a sequence of non-terminal symbols, tokens, or keywords followed by some optional Smalltalk code enclosed in curly brackets, {}. Non-terminal symbols are valid Smalltalk variable names and must be defined somewhere in the parser definition. Forward references are valid. Tokens are enclosed in angle brackets as they are defined in the scanner (e.g., <token>) and keywords are enclosed in double-quotes (e.g., "then"). Keywords that contain double-quotes need to have two double-quotes per each double-quote in the keyword. For example, if you need a keyword for one double-quote character, you would need to enter """" (four double-quote characters). 

The Smalltalk code is evaluated whenever that production is matched. If the code is a zero or a one argument symbol, then that method is performed. For a one argument symbol, the argument is an OrderedCollection that contains one element for each item in the production. If the code isn't a zero or one argument symbol, then the code is executed and whatever is returned by the code is the result of the production. If no Smalltalk code is specified, then the default action is to execute the #reduceFor: method. This method converts all items into an OrderedCollection. If one of the items is another OrderedCollection, then all of its elements are added to the new collection. 

Inside the Smalltalk code you can refer to the values of each production item by using literal strings. The literal string, '1', refers the to value of the first production item. The values for tokens and keywords will be SmaCCToken objects. The value for all non-terminal symbols will be whatever the Smalltalk code evaluates to for that non-terminal symbol. 


Named Symbols

When entering the Smalltalk code, you can get the value for a symbol by using the literal strings (e.g., '2'). However, this creates difficulties when modifying a grammar. If you insert some symbol at the beginning of a production, then you will need to modify your Smalltalk code changing all literal string numbers. Instead you can name each symbol in the production and then refer to the name in the Smalltalk code. To name a symbol (non-terminal, token, or keyword), you need to add a quoted variable name after the symbol in the grammar. For example, "MySymbol : Expression 'expr' "+" <number> 'num' {expr + num} ;" creates two named variables. One for the non-terminal Expression and one for the <number> token. These variables are then used in the Smalltalk code. 


Extended Syntax

SmaCC also has some extended syntax that makes it easier to enter different grammars. Most of the additions are for the productions, but one change that is not for productions is the addition of "::=" as the separator between the non-terminal and the production. The production syntax enhancements are listed in the following table: 
Symbol ? Makes symbol optional. It is equivalent to defining a new production rule: "Optional_Symbol : Symbol {'1'} | {nil};". 
Symbol * or 
Symbol + Makes a repeating symbol. The "*" repeats zero or more times, and the "+" repeats one or more times. It is equivalent to defining a new production rule: "Repeat_Symbol : | Symbol;" for "*" and "Repeat_Symbol : Symbol | Repeat_Symbol Symbol ;" for "+". 
( Productions ) Groups the items in Productions. By itself it is not that useful, but it can be combined with the "?", "*", or "+". It is equivalent to defining "Group_Productions : Productions ;". 
[ Productions ] Equivalent to "( Productions ) ?". 
<% Productions %> Equivalent to "( Productions ) *" 


Parser Comments

The compile page has three options to generate comments. You should always select the "Generate definition comments". That saves the scanner and parser definition strings into the scanner and parser classes. It allows your grammar to be under the same version control system as your Smalltalk code. 

The other two comment options should not be needed unless you need to debug a parser generated. The "generate symbol comments" option will generate a comment that explains what each symbol is mapped to. When SmaCC compiles a grammar it converts all symbols into integers. This comment gives you the integer for each symbol. You may need this information if you have an incorrect scanner definition. For example, you may have overlapping token definitions and SmaCC is picking the wrong one (by default it picks the first one in your scanner definition). When you debug, you can inspect the SmaCCToken object and validate its "id" with those in the symbol comment. If they are different, then you have a bug in your scanner. 

Finally, the "generate item set comments" option should rarely be needed. It generates a listing of all LR(1) item sets in the parser. If you are familiar with LR parsing, then it might be interesting to look at. However, for a moderate sized grammar (e.g., Java), this comment can be a few MB in size. I would not recommend generating such comments when using ENVY -- you don't want to store a 10MB method in your library. For the calculator example in the tutorial, this comment is 9,000 characters long. 


Error Recovery

Normally, when the parser encounters an error, it raises the SmaCCParserError exception and parsing is immediately stopped. However, there are times when you may wish to try to parse more of the input. For example, if you are highlighting code, you do not want to stop highlighting at the first syntax error. Instead you may wish to attempt to recover after the statement separator -- the period ".". SmaCC uses the error symbol to specify where error recovery should be attempted. For example, we may have the following rule to specify a list of Smalltalk statements: 
	Statements : Expression | Statements "." Expression ;
If we wish to attempt recovery from a syntax error when we encounter a period, we can change our rule to be: 
	Statements : Expression | Statements "." Expression | error "." Expression ;
While the error recovery allows you to proceed parsing after a syntax error, it will not allow you to return a parse tree from the input. Once the input has been parsed with errors, it will raise a non-resumable SmaCCParserError. 