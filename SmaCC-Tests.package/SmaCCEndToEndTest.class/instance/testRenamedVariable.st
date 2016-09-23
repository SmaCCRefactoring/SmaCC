public
testRenamedVariable
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Comma ''separator'' Comma {{FooANode}} ;
			Comma : "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,'.
	self assert: node separator value = ','.
	self assert: node separator startPosition = 1.
	self assert: (node tokenVariables includes: #separator).
	self assert: node comma value = ','.
	self assert: node comma startPosition = 2.
	self deny: (self parserClass basicNew symbolTypes includes: #Object)