tests
testLeftAndRightRecursive
	| parserCompiler node |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Foo : Number ''number'' {{Collection}}
				| "(" ''leftParen'' Foo ")" ''rightParen'' {{Collection}} ;
			Number : <number> ''token'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '(((4)))'.
	self assert: node leftParens size = 3.
	self assert: node rightParens size = 3.
	self assert: node number token value = '4'.
	self checkTokensAreInOrder: node leftParens.
	self checkTokensAreInOrder: node rightParens.
	self assert: node children size = 1.
	self assert: node children first == node number.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node