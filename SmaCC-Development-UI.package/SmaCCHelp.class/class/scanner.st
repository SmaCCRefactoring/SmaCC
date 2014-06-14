pages
scanner
	^ HelpTopic
		title: 'Scanner'
		contents:
'SmaCC Scanner

Scanning takes an input stream of characters and converts that into a stream of tokens. The tokens are then passed on to the parsing phase.

The scanner is specified by a collection of token specifications. Each token is specified by:

TokenName    :    RegularExpression ;

TokenName is a valid Smalltalk variable name that is surrounded by <>. For example, "<token>" is a valid TokenName, but "<token name>" is not since "token name" isn''t a valid Smalltalk variable name. The RegularExpression is a regular expression that matches a token. It should match one or more characters in the input stream. The colon character, ":", is used to separate the TokenName and the RegularExpression, and the semicolon character, ";", is used to terminate the token specification.


Regular Expression Syntax

While the rules are specified as regular expressions, there are many different syntaxes for regular expressions. We choose a relatively simple syntax that is specified below. If you wish to have a more rich syntax, you can modify the scanner''s parser: SmaCCDefinitionScanner & SmaCCDefinitionParser. These classes were created using SmaCC.

Expression 			Description
\character 		Matches a special character. The character immediately following
				the backslash is matched exactly, unless it is a letter. Backslash-letter
				combinations have other meanings and are specified below.
\cLetter 			Matches a control character. Control characters are the first 26 characters
				(e.g., \cA equals "Character value: 0"). The letter that follows the "\c" must
				be an uppercase letter.
\d 				Matches a digit, 0-9.
\D 				Matches anything that is not a digit.
\f 				Matches a form-feed character, "Character value: 12".
\n 				Matches a newline character, "Character value: 10".
\r 				Matches a carriage return character, "Character value: 13".
\s 				Matches any whitespace character, [ \f\n\r\t\v].
\S 				Matches any non-whitespace character.
\t 				Matches a tab, "Character value: 9".
\v 				Matches a vertical tab, "Character value: 11"
\w 				Matches any letter, number or underscore, [A-Za-z0-9_].
\W 				Matches anything that is not a letter, number or underscore.
\xHexNumber 	Matches a character specified by the hex number following the "\x". The
				hex number must be at least one character long and no more than four
				characters for Unicode characters and two characters for non-Unicode
				characters. For example, "\x20" matches the space character (Character
				value: 16r20), and "\x1FFF" matches "Character value: 16r1FFF".
<token> 			Copies the definition of <token> into the current regular expression. For
				example, if we have "<hexdigit> : \d | [A-F] ;", we can use <hexdigit> in a
				later rule: "<hexnumber> : <hexdigit> + ;".
<isMethod> 		Copies the characters where Character>>isMethod returns true into the
				current regular expression. For example, instead of using \d, we could
				use <isDigit> since Character>>isDigit returns true for digits.
[characters] 		Matches one of the characters inside the []. This is a shortcut for the "|"
				operator. In addition to single characters, you can also specify character
				ranges with the "-" character. For example, "[a-z]" matches any lower
				case letter.
[^characters] 	Matches any character not listed in the characters block. "[^a]" matches
				anything except for "a".
# comment		Creates a comment that is ignored by SmaCC. Everything from the # to
				the end of the line is ignored.
exp1 | exp2 		Matches either exp1 or exp2.
exp1 exp2 		Matches exp1 followed by exp2. "\d \d" matches two digits.
exp* 			Matches exp zero or more times. "0*" matches "" and "000".
exp? 			Matches exp zero or one time. "0?" matches only "" or "0".
exp+ 			Matches exp one or more times. "0+" matches "0" and "000", but not "".
exp{min,max} 	Matches exp at least min times but no more than max times. "0{1,2}"
				matches only "0" or "00". It does not match "" or "000".
(exp) 			Groups exp for precedence. For example, "(a b)*" matches "ababab".
				Without the parentheses, "a b *" would match "abbbb" but not "ababab".

Since there are multiple ways to combine expressions, we need precedence rules for their combination. The or operator, "|", has the lowest precedence and the "*", "?", "+", and "{,}" operators have the highest precedence. For example, "a | b c *" matches "a" or "bcccc", but not "accc" or "bcbcbc". If you wish to match "a" or "b" followed by any number of c''s, you need to use "(a | b) c *".


Overlapping Tokens

Unlike T-Gen, SmaCC can handle overlapping tokens with any problems. For example, the following is a legal SmaCC scanner definition:

<variable>	: [a-zA-Z] \w* ;
<any_character>	: . ;

This definition will match a variable or a single character. A variable can also be a single character [a-zA-Z], so the two tokens overlap. SmaCC handles overlapping tokens by preferring the longest matching token. If multiple tokens match the longest possible token, then the parser uses the first token specified by the grammar unless you override the SmaCCParser>>tryAllTokens method. For example, an "a" could be a <variable> or an <any_character> token, but since <variable> is specified first, SmaCC will use it.


Matching Methods

If your scanner has a method name that matches the name of the token, (e.g. whitespace), that method will get called upon a match of that type. The SmaCCScanner superclass already has a default implementation of #whitespace and #comment. These methods ignore those tokens by default. If you want to store comments, then you should override the SmaCCScanner>>comment method.

Matching methods can also be used to handle overlapping token classes. For example, in the C grammar, a type definition is the same as an identifier. The only way that they can be disambiguated is by looking up the name in the type table. In our example C parser, we have an IDENTIFIER method that is used to determine whether the token is really an IDENTIFIER or whether it is a TYPE_NAME.


Unreferenced Tokens

If a token is not referenced from a grammar specification, it will not be included in the generated scanner, unless the token''s name is also a name of a method (see previous section). This, coupled with the ability to do substitutions, allows you to have the equivalent of macros within your scanner specification. However, be aware that if you are simply trying to generate a scanner, you will have to make sure that you create a dummy parser specification that references all of the tokens that you want in the final scanner.


Unicode Characters

SmaCC compiles the scanner into a bunch of conditional tests on characters. Normally, it assumes that characters have values between 0 and 255, and it can make some optimizations based on this fact. With the "Allow Unicode Characters" option checked, it will assume that characters have values between 0 and 65535. 


Scanner states

SmaCC can compile scanners with states, and tokens which are active depending on the state of the scanner, allowing one to activate specialized scanners to handle things like the indentation at the beginning of lines in Python, embedded SQL syntax in another language, etc... The syntax consist of preceding the token name in the definition with a state label:

nameOfState <tokenName> :

And, somewhere in the generated parser or scanner, the switch to the other state is activated by:

self state: #nameOfState (in the scanner)
self scanner state: #nameOfState (in the productions actions)

Such states have mutually exclusive definitions: a definition active in one state is not visible in another state. Definitions without state label are considered as belonging to the state #default, which can switched to with:

self state: #default

Examples of that use are the SmaCCPython parser.

Implicit tokens

SmaCC can auto-generates a token specification out of a token name referenced as a method of Character and not instantiated somewhere else. For example, <isUppercase> is an implicit token class matching all characters in Uppercase, as implemented by Character>>asUppercase. Such implicit tokens are allways ordered last and can be used both in the scanner definition and in the grammar productions.'