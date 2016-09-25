tests
testNodeAccess
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new category: self class category.
	parserCompiler
		buildDefinition: 'start : "a" ''x'' { Array with: ''1'' value with: ''1'' value with: x value with: x value } ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a') = #('a' 'a' 'a' 'a')