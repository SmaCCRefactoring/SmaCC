public
testBadCharacterBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	self should: 
			[parserCompiler buildDefinition: '<foo> : [a-] ;
					Start : <foo>;'.
			parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser']
		raise: SmaCCParserError