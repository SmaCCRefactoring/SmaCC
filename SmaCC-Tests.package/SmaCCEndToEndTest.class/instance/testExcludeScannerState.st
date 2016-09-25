tests
testExcludeScannerState
	| parserCompiler parser |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%excludes a;
			<foo> : b;
			a <bar> : a;
			Start : <foo> {true} | <bar> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'b').
	self should: [ self parserClass parse: 'a' ] raise: SmaCCParserError.
	parser := self parserClass on: (ReadStream on: 'a').
	parser state: #a.
	self deny: parser parse.
	parser := self parserClass on: (ReadStream on: 'b').
	parser state: #a.
	self should: [ parser parse ] raise: SmaCCParserError