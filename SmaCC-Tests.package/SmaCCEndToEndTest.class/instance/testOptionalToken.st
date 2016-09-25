tests
testOptionalToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new category: self class category.
	parserCompiler 
		buildDefinition: 
			'<LETTER> : [a-zA-Z_] ;
			<DIGIT> : [0-9] ;
			<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> ":" ? begin {''1'' value , ''3''} | <IDENTIFIER> {''1'' value};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a b : c') = 'abc'