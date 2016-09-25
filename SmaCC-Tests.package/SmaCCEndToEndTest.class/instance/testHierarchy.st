tests
testHierarchy
	| parserCompiler |
	SmaCCScanner
		subclass: #FooScanner
		instanceVariableNames: ''
		classVariableNames: ''
		category: self class category.
	(Smalltalk at: #FooScanner)
		subclass: #TestScanner
		instanceVariableNames: ''
		classVariableNames: ''
		category: self class category.
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
			'%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert: self scannerClass superclass name asString = 'FooScanner'.
	self assert: self parserClass superclass name asString = 'FooParser'