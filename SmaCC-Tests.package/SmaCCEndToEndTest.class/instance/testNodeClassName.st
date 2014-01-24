tests
testNodeClassName
	| compiler pattern |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition: '<number> : \d+; <name> : [a-z]+; <whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; %glr;
			%root FooNode;
			A : Name | Number ;
			Name : <name>''name'' {{FooNameNode}};
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	pattern := self parserClass parse: '`a{nodeClassName: #FooNumberNode}`'.
	self assert: (pattern match: (self parserClass parse: '123')
				inContext: Dictionary new).
	self
		deny: (pattern match: (self parserClass parse: 'abc') inContext: Dictionary new)