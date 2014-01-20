testing
testRepeatingCharactersBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<A> : a{1,3} ;
						<ID> : \w+ ;
						<whitespace> : \s+ ;'
		andParser: 'begin : {true} | begin <A> {''1''} | begin <ID> {false};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'aa').
	self deny: (TestParser parse: 'aaaa')