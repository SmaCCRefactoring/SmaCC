tests
testKeywordsWithStates
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%states default keyword;
			keyword <word> : word;
			keyword default <chars> : [a-z]+;
			Start : <chars>;
			other : <word>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass parse: 'word'