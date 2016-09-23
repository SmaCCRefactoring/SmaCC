tests
testTimesRepeatRewriteBug
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: '<a> : <<[^>]+>>; t : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '<<aa>>')