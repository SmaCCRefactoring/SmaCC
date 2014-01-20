tests
testAutoAnnotateTokens
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<name> : \w+; <whitespace> : \s+; 
			%annotate_tokens;
			%root FooNode;
			A : "(" <name> "<<" "test" ")" {{FooANode}} ; '.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: '( foo << test )'.
	self assert: node nameToken value = 'foo'.
	self assert: node leftParenToken value = '('.
	self assert: node lessThanLessThanToken value = '<<'.
	self assert: node testToken value = 'test'.
	self assert: node rightParenToken value = ')'