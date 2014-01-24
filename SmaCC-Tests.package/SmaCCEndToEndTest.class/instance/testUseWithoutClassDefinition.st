tests
testUseWithoutClassDefinition
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : <number> ''left'' B ''operator'' <number> ''right'' {{FooNode}} ;
			B : C ;
			C : "+" | "-" | "*" | "/" ;'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '1 + 3'.
	self assert: node operator value = '+'