tests
testNonRecursiveVariableInsideRecursiveProduction
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<whitespace> : \s+; 
			%root FooNode;
			A : B "a" ''letter'' {{FooNode}} ;
			B : A | C ;
			C : "c" ''c'' {{FooNode}};'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'c a a a'.
	self assert: node c value = 'c'.
	self assert: node letters size = 3