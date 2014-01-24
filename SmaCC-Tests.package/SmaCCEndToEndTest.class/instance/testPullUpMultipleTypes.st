tests
testPullUpMultipleTypes
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : D B {{FooBNode}} | D C {{FooCNode}};
			B : "b" ''b'' D ;
			C : "c" ''c'' D ;
			D : Number ''number'' | D Number ''number'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '0 b 1 2 3 4'.
	self assert: node class name asString = 'FooBNode'.
	node numbers keysAndValuesDo: 
			[:key :each |
			self assert: (key - 1) printString = each number value.
			self assert: each parent == node].
	self assert: node numbers size = 5