public
testSystemCategory

	| parserCompiler |
	SmaCCParser classInstaller make: [ :builder |
		builder
			subclass: #FooScanner
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'SmaCC-Tests'.

		builder
			subclass: #TestScanner
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'SmaCC-Tests'.

		builder
			superclass: SmaCCParser;
			name: #FooParser;
			slotsFromString: '';
			sharedVariablesFromString: '';
			sharedPools: '';
			category: 'SmaCC-Tests';
			environment: SmaCCParser environment ].

	(Smalltalk at: #FooParser) classInstaller make: [ :builder |
		builder
			superclass: (Smalltalk at: #FooParser);
			name: #TestParser;
			slotsFromString: '';
			sharedVariablesFromString: '';
			sharedPools: '';
			category: '_UnpackagedPackage';
			environment: (Smalltalk at: #FooParser) environment ].
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: '%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert: self scannerClass superclass name asString
		equals: 'FooScanner'.
	self
		assert: self parserClass superclass name asString
		equals: 'FooParser'.
	self assert: self parserClass category equals: '_UnpackagedPackage'.
	self removeClass: self parserClass