tests
testMissingRESemicolon2
	| compiler |
	compiler := SmaCCGrammarCompiler new category: self class category.
	self
		should: [ compiler
				buildDefinition:
					'<a> : \. #This is an error
			<b> : <a>;
			A : <b>;' ]
		raise: SmaCCParserError