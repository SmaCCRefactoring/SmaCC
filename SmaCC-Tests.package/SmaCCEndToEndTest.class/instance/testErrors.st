public
testErrors
	| parserCompiler position |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: self expressionScannerString , self expressionParserString.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self parserClass parse: '+3*4' onError: [:str :pos | position := pos].
	self assert: position = 1.
	self parserClass parseStream: (ReadStream on: '1+a+4')
		onError: [:str :pos | position := pos].
	self assert: position = 3