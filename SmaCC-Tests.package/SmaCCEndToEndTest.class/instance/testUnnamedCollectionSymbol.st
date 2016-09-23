tests-parse tree creation
testUnnamedCollectionSymbol
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' {{FooBNode}} | B "b" ''b'' {{FooBNode}} ;'.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>B<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])