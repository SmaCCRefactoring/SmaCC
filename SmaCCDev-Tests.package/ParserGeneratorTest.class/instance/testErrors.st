testing
testErrors
	| parserCompiler position |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: self expressionScannerString
		andParser: self expressionParserString.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	TestParser parse: '+3*4' onError: [:str :pos | position := pos].
	self assert: position = 1.
	TestParser parseStream: (ReadStream on: '1+a+4')
		onError: [:str :pos | position := pos].
	self assert: position = 3