tests-parse tree creation
testPassThrough
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B ''b'' {{FooANode}} ;
			B : C ;
			C : Number;
			Number : <number> ''number'' {{FooNumberNode}}; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '12'.
	self assert: node class name asString = 'FooANode'.
	self assert: node b parent == node.
	self assert: node b number startPosition = 1.
	self assert: node b number value = '12'