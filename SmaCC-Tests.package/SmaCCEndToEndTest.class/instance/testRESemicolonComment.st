tests
testRESemicolonComment
	| compiler |
	compiler := SmaCCGrammarCompiler new category: self class category.
	self
		shouldnt: [ compiler
				buildDefinition:
					'<a> : \. ; #This is an error ;
			A : <a>;' ]
		raise: SmaCCParserError