testing
testInvertedCharactersBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<A> : a{1,3} ;
						<ID> : [^a]+ ;
						<comment> : \s+ ;'
		andParser: 'begin : {0} | begin <A> {''1'' + 1} | begin <ID> {''1'' - 1};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'aa') = 1.
	self assert: (TestParser parse: 'aaaa') = 2.
	self assert: (TestParser parse: 'a bab') = 0