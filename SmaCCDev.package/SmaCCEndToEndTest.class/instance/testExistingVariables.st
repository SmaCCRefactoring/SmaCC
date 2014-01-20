public
testExistingVariables
	| parserCompiler |
	SmaCCScanner
		subclass: #TestScanner
		instanceVariableNames: 'scanner1 scanner2'
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: ''.
	SmaCCParser
		subclass: #TestParser
		instanceVariableNames: 'parser1 parser2'
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: ''.
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
	self assert: (self scannerClass instVarNames includes: 'scanner1').
	self assert: (self scannerClass instVarNames includes: 'scanner2').
	self assert: (self parserClass instVarNames includes: 'parser1').
	self assert: (self parserClass instVarNames includes: 'parser2')