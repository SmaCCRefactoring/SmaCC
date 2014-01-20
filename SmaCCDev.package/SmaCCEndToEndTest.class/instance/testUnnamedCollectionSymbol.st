tests
testUnnamedCollectionSymbol
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' {{FooBNode}} | B "b" ''b'' {{FooBNode}} ;'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'b'.
	self assert: node class name asString = 'FooANode'.
	self assert: node bs first value = 'b'