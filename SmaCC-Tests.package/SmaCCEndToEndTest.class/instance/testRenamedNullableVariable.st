tests
testRenamedNullableVariable
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%glr;
			%root FooNode;
			A : B ''separator'' C {{FooANode}} ;
			B : C | ;
			C : Comma ''c'';
			Comma : "," ''comma'' {{FooCommaNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,'.
	self assert: node separator comma value = ','.
	self assert: node separator comma startPosition = 1.
	self assert: (node nodeVariables includes: #separator).
	self assert: node c comma value = ','.
	self assert: node c comma startPosition = 2.
	self deny: (self parserClass basicNew symbolTypes includes: #Object).
	node := self parserClass parse: ','.
	self assert: node separator isNil