public
testBadSmalltalkBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	self should: 
			[parserCompiler
				buildDefinition: '<foo> : foo ;
					Start : <foo> {self printOn: };'.
			parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser']
		raise: SmaCCParserError