testing
testNonAssociativeTokens
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<IDENTIFIER> : \w+ ; <whitespace> : \s+ ;'
		andParser: '%left "and" ;
					%nonassoc "=" "<=";
					%left "+" ;

					expr : expr "=" expr {true} | expr "<=" expr {true} | expr "and" expr {true} | expr "+" expr {true} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self should: [TestParser parse: 'a=b=c'] raise: SmaCCParserError.
	self should: [TestParser parse: 'a=b<=c'] raise: SmaCCParserError.
	self should: [TestParser parse: 'a=b+c=d'] raise: SmaCCParserError.
	self assert: (TestParser parse: 'a=b and c=d')