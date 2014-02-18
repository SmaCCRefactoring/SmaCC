pages
directives
	^ HelpTopic
		title: 'Directives'
		contents:
'SmaCC Directives

SmaCC has several directives that can change how the scanner and parser is generated. Each directive begins with a "%" character and the directive keyword. Depending on the directive, there may be a set of arguments. Finally, the directive is terminated with a semicolon character, ";".


Ambiguous Grammars and Precedence

SmaCC can handle ambiguous grammars. Given an ambiguous grammar, SmaCC will produce some parser. However, it may not parse correctly. For an LR parser, there are two basic types of ambiguities, reduce/reduce conflicts and shift/reduce conflicts. Reduce/reduce conflicts are bad. SmaCC has no directives to handle them and just picks one of the choices. These conflicts normally require a rewrite of your grammar or switch to GLR parsing.

On the other hand, shift/reduce conflicts can be handled by directives. When SmaCC encounters a shift/reduce conflict it will perform the shift action by default. However, you can control this action with the "%left", "%right", and "%nonassoc" directives. If a token has been declared in a "%left" directive, it means that the token is left-associative. Therefore, the parser will perform a reduce operation. However, if it has been declared as right-associative, it will perform a shift operation. A token defined as %nonassoc will produce an error if that is encountered during parsing. For example, you may want to specify that the equal operator, "=", is non-associative, so "a = b = c" is not parsed as a valid expression. All three directives are followed by a list of tokens.

Additionally, the %left, %right, and %nonassoc directives allow precedence to be specified. The order of the directives specifies the precedence of the tokens. The higher precedence tokens appear on the higher line numbers. For example, the following directive section gives the precedence for the simple calculator in our tutorial:

%left "+" "-";
%left "*" "/";
%right "^";

The "+" and "-" symbols appear on the first line and have the lowest precedence. They are also left-associative so "1 + 2 +3" will be evaluated as "(1 + 2) + 3". On the next line are the "*" and "/" symbols. Since they appear on a higher line number, they have higher precedence than the "+" and "-". Finally, on line three we have the "^" symbol. It has the highest precedence. Combining all the rules allows us to parse "1 + 2 * 3 / 4 ^ 2 ^ 3" as "1 + ((2 * 3) / (4 ^ (2 ^ 3)))".


Start Symbols

By default, the left-hand side of the first grammar rule is the start symbol. If you want to multiple start symbols, then you can specify them by using the "%start" directive followed by the nonterminals that are additional start symbols. This is useful for creating two parsers with two grammars that are similar but slightly different. For example, consider a Smalltalk parser. You can parse methods, and you can parse expressions. These are two different operations, but have very similar grammars. Instead of creating two different parsers for parsing methods and expressions, we can specify one grammar that parses methods and also specify another starting position for parsing expressions. The StParser in the SmaCC Example Parsers package has an example of this. The StParser class>>parseMethod: uses the #startingStateForMethod position to parse methods and the StParser class>>parseExpression: uses the #startingStateForSequenceNode position to parse expressions.


Id Methods

Internally, the various token types are represented as integers. However, there are times that you need to reference the various token types. For example, in the CScanner and CParser classes, the TYPE_NAME token is identical to the IDENTIFIER token. The IDENTIFIER matching method does a lookup in the type table and if it finds a type definition with the same name as the current IDENTIFIER, it returns the TYPE_NAME token type. To determine what integer this is, the parser was created with an %id directive for <IDENTIFIER> and <TYPE_NAME>. This generates the IDENTIFIERId and TYPE_NAMEId methods on the scanner. These methods simply return the number representing that token type. See the C sample scanner and parser for an example of how this is used.


Case Insensitive Scanning

You can specify that the scanner should ignore case differences by using the "%ignorecase;" directive. If you have a language that is case insensitive and has several keywords, this can be a handy feature to have. For example, if you have "THEN" as a keyword in a case insensitive language, you would need to specify a token for then as "<then> : [tT] [hH] [eE] [nN] ;". This is a pain to enter correctly. When the ignorecase directive is used, SmaCC will automatically convert "THEN" into "[tT][hH][eE][nN]".


GLR Parsing

SmaCC allows you to parse ambiguous grammars using a GLR parser. The "%glr;" directive changes the type of parser that SmaCC generates. Instead of your generated parser being a subclass of SmaCCParser, when you specify the "%glr;" directive, your parser will be a subclass of SmaCCGLRParser.

If you parse a string that has multiple representations, SmaCC will throw a SmaCCAmbiguousResultNotification exception that can be handled by user code. This exception has the potential parses. The value that it is resumed with will be selected as the definitive parse value. If the exception is not handled, then it will pick one as the definitive parse value.


AST Directives

There are several directives that are used when creating AST''s. The "%root" directive is used to specify the root class in the AST hierarchy. The %root directive has a single argument that is the name that will be used to create the root class in the AST. This class will be created as a subclass of SmaCCParseNode. The "%prefix" and "%suffix" directives tell SmaCC the prefix and suffix to add to every AST node''s class name. These are automatically added to every AST node including the %root node. For example, the following will create a RBProgramNode class that is a subclass of SmaCCParseNode and is the root of all AST nodes defined by this parser.

%root Program;
%prefix RB;
%suffix Node;

By default all nodes created by SmaCC will be direct subclass of your %root class. However, you can specify the hierarchy by using the "%hierarchy" directive. The syntax of the %hierarchy is "%hierarchy SuperclassName ( SubclassName );". If you have multiple subclasses, you can list all of them inside the parenthesis separated by whitespace:

%hierarchy Program (Expression Statement);

Two final AST directives deal with the generated classes'' instance variables. One directive allows you to add some unused instance variables to your classes so you can later extend the generated classes to use those variables. To add an instance variable to your class, you can use the %attributes directive. The first argument to the directive is the class name, and the second argument is a list of variable names. For example, we could add a variable named "cachedValue" to our Expression class with the following "%attributes Expression (cachedValue);". The other instance variable directive is "%ignore_variables". When SmaCC creates the AST nodes it automatically creates appropriate #= and #hash methods. By default, these methods use all variables when comparing equality. The %ignore_variables directive allows you to specify certain variables to ignore when comparing. For example, you may wish to ignore parentheses when you compare expressions. If you named your "(" token ''leftParen'' and you ")" token ''rightParen'', then you can use "%ignore_variables leftParen rightParen;".'