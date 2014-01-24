tests
testNodeWithoutRoot
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: 'test : "a" ''letter'' {{FooNode}};'.
	self should: 
			[parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser']
		raise: SmaCCCompilationNotification