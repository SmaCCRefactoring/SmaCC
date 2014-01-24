public
testImplicitParserTokens
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: 'A : <isLetter> {true};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a').
	self should: [self parserClass parse: ' '] raise: SmaCCParserError