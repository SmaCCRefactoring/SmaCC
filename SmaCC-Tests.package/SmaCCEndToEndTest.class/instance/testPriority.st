public
testPriority
	| parserCompiler |
	SmaCCScanner
		subclass: #TestScanner
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'SmaCC-Tests'.
	(self lookupType: #TestScanner) compile: 'all ^self recordAndReportMatch: (Array with: self _allId)'.
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition:
			'%ignorecase;
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