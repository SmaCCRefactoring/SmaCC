tests
testMissingRESemicolonComment
	| compiler |
	compiler := SmaCCGrammarCompiler new category: self class category.
	self
		should: [ compiler
				buildDefinition:
					'<a> : \. #This is an error ;
			A : <a>;' ]
		raise: SmaCCParserError