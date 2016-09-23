tests-parse tree creation
testOptionalComponent
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' | ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ''.
	self assert: node b isNil.
	node := self parserClass parse: 'b'.
	self assert: node b startPosition = 1