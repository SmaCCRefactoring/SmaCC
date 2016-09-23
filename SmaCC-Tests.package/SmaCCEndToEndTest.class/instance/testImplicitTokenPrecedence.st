tests
testImplicitTokenPrecedence
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : . ;
			A : <a> {true} | <isLetter> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	0 to: 255 do:
		[ :each | 
		self
			assert: (self parserClass parse: (String with: (Character value: each))) ]