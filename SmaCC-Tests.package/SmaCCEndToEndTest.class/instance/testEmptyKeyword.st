tests
testEmptyKeyword
	| compiler |
	compiler := SmaCCGrammarCompiler new.
	self should: [ compiler buildDefinition: 'A : "";' ] raise: SmaCCParserError