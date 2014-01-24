public
testInvertedCharactersBlock
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '%ignorecase;
			<A> : a{1,3} ;
			<ID> : [^a]+ ;
			<comment> : \s+ ;
			begin : {0} | begin <A> {''1'' + 1} | begin <ID> {''1'' - 1};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: 'aa') = 1.
	self assert: (self parserClass parse: 'aaaa') = 2.
	self assert: (self parserClass parse: 'a bab') = 0