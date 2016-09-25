public
testRenamedVariableCollection
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Commas ''separator'' "a" ''a'' Commas {{FooANode}} ;
			Commas : | Commas "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,,a,,,'.
	self assert: node separators size = 3.
	self assert: node separators first value = ','.
	self assert: node separators first startPosition = 1.
	self
		assert:
			node compositeTokenVariables asSortedCollection asArray
				= #(#commas #separators).
	self deny: (self parserClass basicNew symbolTypes includes: #Object)