testing
testRepeatMultipleToken
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<LETTER> : [a-zA-Z_] ;
						<DIGIT> : [0-9] ;
						<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>){1,2}	;
						<whitespace>: \s+	;'
		andParser: 'begin : <IDENTIFIER> + ;'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	parserCompiler
		compileItemSetsComment;
		compileSymbolComment.
	self 
		assert: ((TestParser parse: 'a1 bb c44') collect: [:each | each value]) 
				asArray = #('a1' 'bb' 'c44').
	self 
		assert: ((TestParser parse: 'aaaaa') collect: [:each | each value]) asArray 
				= #('aaa' 'aa').
	self should: [TestParser parse: ''] raise: SmaCCParserError