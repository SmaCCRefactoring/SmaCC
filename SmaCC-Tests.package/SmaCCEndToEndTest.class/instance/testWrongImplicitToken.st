tests
testWrongImplicitToken
	| compiler |
	compiler := SmaCCGrammarCompiler new.
	[ 
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%annotate_tokens;
			%root FooNode;
			A : "(" <name> "<<" "test" ")" {{FooANode}} ; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		on: SmaCCParserError
		do: [ :ex | ^ self ].
	self fail