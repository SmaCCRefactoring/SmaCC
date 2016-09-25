tests
testImplicitScannerTokens
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : <isLetter> + ;
			A : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'asdfssdafADSFS').
	self
		should: [ self parserClass parse: ' asdf asdf' ]
		raise: SmaCCParserError