testing
testReuseCompositeToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<LETTERDIGIT> : [a-zA-Z_] \d ;
						<AAorBB> :  aa | bb;
						<IDENTIFIER>: <LETTERDIGIT> | <AAorBB>	;
						<whitespace>: \s+	;'
		andParser: 'begin : <IDENTIFIER> begin {false} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self should: [TestParser parse: '2'] raise: SmaCCParserError.
	self assert: (TestParser parse: 'aa').
	self assert: (TestParser parse: 'bb').
	self assert: (TestParser parse: 'a4').
	self should: [TestParser parse: 'ab'] raise: SmaCCParserError.
	self should: [TestParser parse: '4b'] raise: SmaCCParserError