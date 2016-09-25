tests
testMoveToGLRHierarchy
	| parserCompiler |
	SmaCCParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: self class category.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: self class category.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
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
	self
		assert: self parserClass superclass name asString = 'SmaCCGLRParser'