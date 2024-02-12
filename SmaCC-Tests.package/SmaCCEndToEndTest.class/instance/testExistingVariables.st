tests
testExistingVariables

	| parserCompiler |
	SmaCCScanner classInstaller make: [ :builder |
		builder
			superclass: SmaCCScanner;
			name: #TestScanner;
			slotsFromString: 'scanner1 scanner2';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCScanner environment ].
	SmaCCParser classInstaller make: [ :builder |
		builder
			superclass: SmaCCParser;
			name: #TestParser;
			slotsFromString: 'parser1 parser2';
			sharedVariablesFromString: '';
			category: self class category;
			environment: SmaCCParser environment ].
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
	self assert: (self scannerClass instVarNames includes: 'scanner1').
	self assert: (self scannerClass instVarNames includes: 'scanner2').
	self assert: (self parserClass instVarNames includes: 'parser1').
	self assert: (self parserClass instVarNames includes: 'parser2')