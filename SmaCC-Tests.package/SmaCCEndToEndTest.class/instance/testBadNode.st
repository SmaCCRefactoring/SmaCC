tests-parse tree creation
testBadNode
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : B "a" ''a'' {{FooNode}} ;
			B : A | C ;
			C : "c" ''c''; '.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>A<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])