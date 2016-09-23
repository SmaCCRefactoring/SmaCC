tests
testBadCharacterBlock
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	self
		should:
			[ parserCompiler
				buildDefinition:
					'<foo> : [a-] ;
					Start : <foo>;'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCParserError