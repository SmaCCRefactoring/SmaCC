tests
testPullUpNullNodeAsVariables
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '%glr;
			<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B D {{FooANode}};
			B : <number> ''a'' <number> ''b'' {{FooBNode}} | ;
			D : <number> ''c''; '.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3'.
	self assert: node class name asString = 'FooANode'.
	self assert: node a value = '1'.
	self assert: node b value = '2'.
	self assert: node c value = '3'.
	node := self parserClass parse: '1'.
	self assert: node a isNil.
	self assert: node b isNil.
	self assert: node c value = '1'