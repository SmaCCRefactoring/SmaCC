tests
testMultipleComponents
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '%root FooNode;
			A : B C {{FooANode}} ;
			B : "b" ''b'' ;
			C : "c" ''c'';'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'bc'.
	self assert: node class name asString = 'FooANode'.
	self assert: node b startPosition = 1.
	self assert: node c startPosition = 2