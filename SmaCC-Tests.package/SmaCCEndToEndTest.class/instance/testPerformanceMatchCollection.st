public
testPerformanceMatchCollection
	| parserCompiler node match fastTime slowTime |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<number> : \d; <whitespace> : \s+; 
			<patternToken>: (\`  [^\`]* \`)+ ;
			%glr;
			%root Parse ; %prefix Foo; %suffix Node;
			%left "+" "-" ;
			ExpressionList : ExpressionList Expression ''expression'' {{ExpressionList}}  | Expression ''expression'' {{ExpressionList}};
			Expression : Number ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: (String new: 1000 withAll: $1) , '22'
						, (String new: 1000 withAll: $1).
	fastTime := Time
				millisecondsToRun: [self assert: (node match: node inContext: Dictionary new)].
	match := self parserClass parse: '`a{beList}` 22 `b{beList}`'.
	slowTime := Time millisecondsToRun: 
					[self assert: (match match: node inContext: Dictionary new)].
	self assert: (fastTime min: 1) * 10 > slowTime