tests
testRepeatToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new category: self class category.
	parserCompiler
		buildDefinition:
			'<LETTER> : [a-zA-Z_] ;
			<DIGIT> : [0-9] ;
			<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> * ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: ((self parserClass parse: 'a b c') collect: [ :each | each value ]) asArray = #('a' 'b' 'c').
	self assert: (self parserClass parse: '') size = 0