testing
testMultipleStartingPositions
	| parserCompiler position |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<name> : \w+;'
		andParser: '%start plus ;

					multiply: plus "*" plus {true};
					plus: <name> {false} | <name> "+" <name> {false};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'a*a').
	self assert: (TestParser parse: 'a+a*a').
	self should: [TestParser parse: 'a+a'] raise: SmaCCParserError.
	self 
		deny: (TestParser parse: 'a+a' startingAt: TestParser startingStateForplus).
	TestParser 
		parse: 'a*a'
		startingAt: TestParser startingStateForplus
		onError: [:str :pos | position := pos].
	self assert: position = 2