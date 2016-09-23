tests
testCrLf
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : \r? \n | \r ;
			A : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass
				parse: (String with: Character cr with: Character lf)).
	self
		should:
			[ self parserClass
				parse: (String with: Character cr with: Character cr) ]
		raise: SmaCCParserError