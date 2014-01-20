testing
testBadSmalltalkBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	self should: 
			[parserCompiler buildScanner: '<foo> : foo ;' andParser: 'Start : <foo> {self printOn: };'.
			parserCompiler compileInto: TestScanner andParser: TestParser]
		raise: SmaCCParserError