public
testAmbiguousReduceReduceConflict
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<int> : \d+; <whitespace>: \s+;
			%glr;
			Expression : Left "!" "<" {''1''} | Right "!" ">" {''1''} ;
			Left : <int> "+" <int> "*" <int> {''1'' value asNumber + ''3'' value asNumber * ''5'' value asNumber};
			Right : <int> "+" <int> "*" <int> {''1'' value asNumber + (''3'' value asNumber * ''5'' value asNumber)};
			'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: '2 + 3 * 4!<') = 20.
	self assert: (self parserClass parse: '2 + 3 * 4!>') = 14.
	self should: [self parserClass parse: '2 + 3 * 4!!'] raise: SmaCCParserError