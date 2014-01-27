testing
testImplicitParserTokens
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '' andParser: 'A : <isLetter> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'a').
	self should: [TestParser parse: ' '] raise: SmaCCParserError