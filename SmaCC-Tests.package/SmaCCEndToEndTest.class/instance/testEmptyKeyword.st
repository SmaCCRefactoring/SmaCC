tests
testEmptyKeyword
	| compiler |
	compiler := SmaCCGrammarCompiler new category: self class category.
	self should: [ compiler buildDefinition: 'A : "";' ] raise: SmaCCParserError