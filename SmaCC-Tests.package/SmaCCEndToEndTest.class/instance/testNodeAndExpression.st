tests-parse tree creation
testNodeAndExpression
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root FooNode;
			A : B "a" ''a'' {{FooNode}} ;
			B : {Object new} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node a value = 'a'