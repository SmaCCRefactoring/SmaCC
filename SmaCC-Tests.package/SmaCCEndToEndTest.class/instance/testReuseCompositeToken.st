public
testReuseCompositeToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<LETTERDIGIT> : [a-zA-Z_] \d ;
			<AAorBB> :  aa | bb;
			<IDENTIFIER>: <LETTERDIGIT> | <AAorBB>	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> begin {false} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self should: [self parserClass parse: '2'] raise: SmaCCParserError.
	self assert: (self parserClass parse: 'aa').
	self assert: (self parserClass parse: 'bb').
	self assert: (self parserClass parse: 'a4').
	self should: [self parserClass parse: 'ab'] raise: SmaCCParserError.
	self should: [self parserClass parse: '4b'] raise: SmaCCParserError