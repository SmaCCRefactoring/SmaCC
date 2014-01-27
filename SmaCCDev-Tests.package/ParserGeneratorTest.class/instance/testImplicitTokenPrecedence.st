testing
testImplicitTokenPrecedence
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : . ;'
		andParser: 'A : <a> {true} | <isLetter> {false};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	0 to: 255
		do: [:each | self assert: (TestParser parse: (String with: (Character value: each)))]