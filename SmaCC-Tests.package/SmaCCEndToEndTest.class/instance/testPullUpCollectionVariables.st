tests-parse tree creation
testPullUpCollectionVariables
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : AList {{FooNode}} ;
			AList : B | AList B;
			B : <number> ''number'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	node numbers
		keysAndValuesDo: [ :key :each | self assert: key printString = each value ].
	self assert: node numbers size = 4