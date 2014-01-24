tests
testRightRecursive
	| parserCompiler node copy |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Foo : Number ''number'' {{Collection}}
				| Number ''number''  "," ''comma'' Foo {{Collection}} ;
			Number : <number> ''token'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '1 , 2 , 3 , 4'.
	self assert: node numbers size = 4.
	node numbers keysAndValuesDo: 
			[:key :each |
			self assert: key printString = each token value.
			self assert: each parent == node.
			self assert: (node children includes: each)].
	self assert: node commas size = 3.
	node commas inject: 0
		into: 
			[:sum :each |
			self assert: sum < each startPosition.
			each startPosition].
	node commas do: [:each | self assert: each value = ','].
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy numbers ~~ node numbers.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node