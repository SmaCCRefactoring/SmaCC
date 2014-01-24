public
testRepeatingCharactersBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<A> : a{1,3} ;
			<ID> : \w+ ;
			<whitespace> : \s+ ;
			begin : {true} | begin <A> {''1''} | begin <ID> {false};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: 'aa').
	self deny: (self parserClass parse: 'aaaa')