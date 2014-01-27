testing
testNodeAccess
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildScanner: ''
		andParser: 'start : "a" ''x'' { Array with: ''1'' value with: ''1'' value with: x value with: x value } ;'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'a') = #( 'a'  'a'  'a'  'a' )