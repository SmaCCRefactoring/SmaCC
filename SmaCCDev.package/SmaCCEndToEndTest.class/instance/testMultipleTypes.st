tests
testMultipleTypes
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B | C ;
			B : "b" ''b'' D {{FooBNode}} ;
			C : "c" ''c'' D {{FooCNode}};
			D : Number ''number'' | D "," ''comma'' Number ''number'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'b 1, 2, 3, 4'.
	self assert: node class name asString = 'FooBNode'.
	node numbers keysAndValuesDo: 
			[:key :each |
			self assert: key printString = each number value.
			self assert: each parent == node].
	self assert: node numbers size = 4.
	self assert: node commas size = 3