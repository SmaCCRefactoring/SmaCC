tests-parse tree creation
testEmptyAlternative
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root FooNode;
			A : B ''component'' {{FooANode}} ;
			B :  | C ; 
			C : "c" ''c'' {{FooCNode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'c'.
	self assert: node class name asString = 'FooANode'.
	self assert: node component c value = 'c'.
	self assert: node component parent == node.
	node := self parserClass parse: ''.
	self assert: node component isNil