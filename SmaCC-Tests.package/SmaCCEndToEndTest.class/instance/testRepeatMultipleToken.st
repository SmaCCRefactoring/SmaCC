tests
testRepeatMultipleToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new category: self class category.
	parserCompiler
		buildDefinition:
			'<LETTER> : [a-zA-Z_] ;
			<DIGIT> : [0-9] ;
			<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>){1,2}	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> + ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: ((self parserClass parse: 'a1 bb c44') collect: [ :each | each value ]) asArray = #('a1' 'bb' 'c44').
	self assert: ((self parserClass parse: 'aaaaa') collect: [ :each | each value ]) asArray = #('aaa' 'aa').
	self should: [ self parserClass parse: '' ] raise: SmaCCParserError