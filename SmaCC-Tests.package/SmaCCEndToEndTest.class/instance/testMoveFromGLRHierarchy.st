tests
testMoveFromGLRHierarchy

	| parserCompiler |
	SmaCCGLRParser classInstaller make: [ :builder |
		builder
			superclass: SmaCCGLRParser;
			name: #FooParser;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCGLRParser environment ].
	(Smalltalk at: #FooParser) classInstaller make: [ :builder |
		builder
			superclass: (Smalltalk at: #FooParser);
			name: #TestParser;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: (Smalltalk at: #FooParser) environment ].
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler buildDefinition: '%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert:
		self parserClass superclass name asString = 'SmaCCParser'