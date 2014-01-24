tests
testOptionalCollection
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B_opt {{FooANode}} ;
			B_opt : B | ;
			B : Number ''numberNode'' | B Number ''numberNode'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	node numberNodes keysAndValuesDo: 
			[:key :each |
			self assert: key printString = each number value.
			self assert: each parent == node].
	self assert: node numberNodes size = 4