tests
testReuseSimpleToken
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<LETTER> : [a-zA-Z_\\] ;
			<DIGIT> : [0-9] ;
			<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> begin {false} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '2' ] raise: SmaCCParserError.
	self assert: (self parserClass parse: '\')