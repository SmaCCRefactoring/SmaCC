testing
testImplicitScannerTokens
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : <isLetter> + ;'
		andParser: 'A : <a> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'asdfssdafADSFS').
	self should: [TestParser parse: ' asdf asdf'] raise: SmaCCParserError