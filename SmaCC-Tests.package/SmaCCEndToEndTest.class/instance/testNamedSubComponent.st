tests
testNamedSubComponent
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : {{FooANode}} | "a" ''a'' A ''sub'' {{FooANode}} ;'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'aaa'.
	self assert: node class name asString = 'FooANode'.
	self assert: node a startPosition = 1.
	self assert: node sub a startPosition = 2.
	self assert: node sub parent == node.
	self assert: node sub sub a startPosition = 3.
	self assert: node sub sub parent == node sub.
	self assert: node sub sub sub a isNil.
	self assert: node sub sub sub parent == node sub sub.
	self assert: node sub sub sub sub isNil