testing
testExcludeScannerState
	| parserCompiler parser |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '
					%excludes a;
					<foo> : b;
					a <bar> : a;'
		andParser: '
				Start : <foo> {true} | <bar> {false};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'b').
	self should: [TestParser parse: 'a'] raise: SmaCCParserError.
	parser := TestParser on: (ReadStream on: 'a').
	parser scanner state: #a.
	self deny: parser parse.
	parser := TestParser on: (ReadStream on: 'b').
	parser scanner state: #a.
	self should: [parser parse] raise: SmaCCParserError