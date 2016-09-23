tests
testIgnoreCaseWithMultipleKeywordCases
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<whitespace> : \s+ ;
			Start ::= "if" "If" "iF" "IF" {true}; '.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'IF IF IF IF').
	self assert: (self parserClass parse: 'iF If IF If')