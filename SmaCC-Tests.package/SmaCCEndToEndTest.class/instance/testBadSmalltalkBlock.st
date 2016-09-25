tests
testBadSmalltalkBlock
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	self
		should:
			[ parserCompiler
				buildDefinition:
					'<foo> : foo ;
					Start : <foo> {self printOn: };'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCParserError