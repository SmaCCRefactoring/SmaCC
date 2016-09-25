tests
testNonAssociativeTokens
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<IDENTIFIER> : \w+ ; <whitespace> : \s+ ;
			%left "and" ;
			%nonassoc "=" "<=";
			%left "+" ;
			expr : expr "=" expr {true} | expr "<=" expr {true} | expr "and" expr {true} | expr "+" expr {true} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		should: [ self parserClass parse: 'a=b=c' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a=b<=c' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a=b+c=d' ]
		raise: SmaCCParserError.
	self assert: (self parserClass parse: 'a=b and c=d')