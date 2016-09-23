tests
testMultipleStartingPositions
	| parserCompiler position |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<name> : \w+;
			%start plus ;
			multiply: plus "*" plus {true};
			plus: <name> {false} | <name> "+" <name> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a*a').
	self assert: (self parserClass parse: 'a+a*a').
	self
		should: [ self parserClass parse: 'a+a' ]
		raise: SmaCCParserError.
	self
		deny:
			(self parserClass
				parse: 'a+a'
				startingAt: self parserClass startingStateForplus).
	self parserClass
		parse: 'a*a'
		startingAt: self parserClass startingStateForplus
		onError: [ :str :pos | position := pos ].
	self assert: position = 2