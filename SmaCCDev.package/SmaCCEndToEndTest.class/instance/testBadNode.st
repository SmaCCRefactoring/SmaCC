tests
testBadNode
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<whitespace> : \s+; 
			%root FooNode;
			A : B "a" ''a'' {{FooNode}} ;
			B : A | C ;
			C : "c" ''c''; '.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'c a  a a'.
	self assert: node c startPosition = 1.
	self assert: node as size = 3.
	self checkTokensAreInOrder: node as