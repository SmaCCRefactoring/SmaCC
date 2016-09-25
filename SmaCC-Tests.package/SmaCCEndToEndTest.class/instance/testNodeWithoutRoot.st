tests-parse tree creation
testNodeWithoutRoot
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler buildDefinition: 'test : "a" ''letter'' {{FooNode}};'.
	self
		should:
			[ parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCCompilationNotification