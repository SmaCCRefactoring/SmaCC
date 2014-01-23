testing
testBadCharacterBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	self
		should: [ 
			parserCompiler buildScanner: '<foo> : [a-] ;' andParser: 'Start : <foo>;'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCParserError