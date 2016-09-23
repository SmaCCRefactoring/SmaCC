public
testOptionalVariableType
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Comma {{FooANode}} ;
			Comma : "," ''comma'' |  ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			self parserClass basicNew symbolTypes asSet asSortedCollection asArray
				= #(#FooANode #SmaCCToken)