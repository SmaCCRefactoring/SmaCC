public
testOverlappingTokens
	| parserCompiler result |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<id1> : \w+; <id2> : \w+;
			%glr;
			Test : "keyword" {''1''} | <id1> {''1''} | <id2> {''1''} ;
			'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	result := self parserClass parse: 'keyword'.
	self assert: result ids size = 3