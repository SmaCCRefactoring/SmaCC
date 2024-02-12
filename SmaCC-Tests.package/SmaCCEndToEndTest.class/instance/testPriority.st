tests
testPriority

	| parserCompiler |
	SmaCCScanner classInstaller make: [ :builder |
		builder
			superclass: SmaCCScanner;
			name: #TestScanner;
			slotsFromString: '';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCScanner environment ].
	(self lookupType: #TestScanner) compile:
		'all ^self recordAndReportMatch: (Array with: self _allId)'.
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
	self assert: (self parserClass parse: '{').
	self assert: (self parserClass parse: '<%').
	self deny: (self parserClass parse: '}')