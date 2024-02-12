tests
testHierarchy

	| parserCompiler |
	SmaCCScanner classInstaller make: [ :builder |
		builder
			superclass: SmaCCScanner;
			name: #FooScanner;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCScanner environment ].
	(Smalltalk at: #FooScanner) classInstaller make: [ :builder |
		builder
			superclass: (Smalltalk at: #FooScanner);
			name: #TestScanner;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: (Smalltalk at: #FooScanner) environment ].
	SmaCCParser classInstaller make: [ :builder |
		builder
			superclass: SmaCCParser;
			name: #FooParser;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCParser environment ].
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
		self scannerClass superclass name asString = 'FooScanner'.
	self assert: self parserClass superclass name asString = 'FooParser'