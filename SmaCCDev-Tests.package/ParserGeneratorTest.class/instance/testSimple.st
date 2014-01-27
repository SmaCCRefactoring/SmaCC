testing
testSimple
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : a ;' andParser: 'begin : <a> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self should: [TestParser parse: '2'] raise: SmaCCParserError.
	self assert: (TestParser parse: 'a')