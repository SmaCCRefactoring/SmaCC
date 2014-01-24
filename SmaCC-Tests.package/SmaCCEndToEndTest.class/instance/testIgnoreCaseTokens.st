public
testIgnoreCaseTokens
	| parserCompiler result |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '%ignorecase;
			<whitespace> : \s+ ;
			Start ::= "a" "a" {Array with: ''1'' with: ''2''};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	result := self parserClass parse: 'a A'.
	self assert: result first = result last.
	self assert: result first hash = result last hash