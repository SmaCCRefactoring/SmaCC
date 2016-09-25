tests-parse tree creation
testPullUpVariablesForLaterSymbols
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : "a" ''a'' B_opt {{FooNode}} ;
			B_opt : B | ;
			B : <number> ''number'' | B <number> ''number'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a 1 2 3 4'.
	node numbers
		keysAndValuesDo: [ :key :each | self assert: key printString = each value ].
	self assert: node numbers size = 4.
	node := self parserClass parse: 'a'.
	self assert: node numbers isEmpty