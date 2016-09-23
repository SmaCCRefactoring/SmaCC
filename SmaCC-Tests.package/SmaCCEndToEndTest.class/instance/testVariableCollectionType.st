public
testVariableCollectionType
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Commas {{FooANode}} ;
			Commas : "," ''comma'' | Commas "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			self parserClass basicNew symbolTypes asSet asSortedCollection asArray
				= #(#FooANode #OrderedCollection #SmaCCToken)