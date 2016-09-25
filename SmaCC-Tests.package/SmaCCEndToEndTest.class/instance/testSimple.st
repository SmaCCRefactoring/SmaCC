tests
testSimple
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : a ;
			begin : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '2' ] raise: SmaCCParserError.
	self assert: (self parserClass parse: 'a')