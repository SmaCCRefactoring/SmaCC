tests-parse tree creation
testParseAllPattern
	| compiler trees node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root FooNode; %glr;
			A : "f:" ''f'' Z ''z'' {{FooANode}} | A "f:" ''f'' Z ''z'' {{FooANode}};
			Z : B | C;
			B : "b" ''b'' {{FooBNode}};
			C : "c" ''c'' {{FooCNode}}; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	trees := self parserClass
		parseAll: 'f: `a` f: `b`'
		startingAt: self parserClass defaultStartingState.
	self assert: trees size = 1.
	node := trees first.
	self assert: node fs size = 2.
	trees := self parserClass
		parseAll: 'f: `a{beToken}` f: `b{beToken}`'
		startingAt: self parserClass defaultStartingState.
	self assert: trees size = 4.
	node := trees first.
	self assert: node fs size = 2