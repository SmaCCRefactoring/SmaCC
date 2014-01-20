public
testGLRHierarchy
	| parserCompiler |
	SmaCCGLRParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: ''.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: ''.
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition:
			'%ignorecase; %glr;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: self parserClass superclass name asString = 'FooParser'