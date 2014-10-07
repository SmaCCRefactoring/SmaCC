tests
testUnnamedNodeVariable
	| compiler |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition:
			'%glr;
			<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B D {{FooANode}};
			B : <number> ''a'' <number> ''b'' {{FooBNode}} | ;
			D : <number> ''c''; '.
	self
		assert:
			([ 
			compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do: [ :ex | 
					('Node creation' = ex messageText and: [ '*>>>B<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])