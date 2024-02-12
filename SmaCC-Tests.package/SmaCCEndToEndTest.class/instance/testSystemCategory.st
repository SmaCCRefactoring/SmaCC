public
testSystemCategory

	| parserCompiler |
	SmaCCScanner
		subclass: #FooScanner
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SmaCC-Tests'.
	(Smalltalk at: #FooScanner)
		subclass: #TestScanner
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SmaCC-Tests'.
	SmaCCParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SmaCC-Tests'.
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
	self assert:
		self scannerClass superclass name asString = 'FooScanner'.
	self assert: self parserClass superclass name asString = 'FooParser'.
	self assert: self parserClass category = '_UnpackagedPackage'.
	self removeClass: self parserClass