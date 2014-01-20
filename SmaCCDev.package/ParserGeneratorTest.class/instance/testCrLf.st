testing
testCrLf
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : \r? \n | \r ;'
		andParser: 'A : <a> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self 
		assert: (TestParser parse: (String with: Character cr with: Character lf)).
	self 
		should: [TestParser parse: (String with: Character cr with: Character cr)]
		raise: SmaCCParserError