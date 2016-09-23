tests
testLALRErrorHandler
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<whitespace> : \s+ ;
			Start : Foo "]" Foo ")";
			Foo : "a" Bar ;
			Bar : "b" | error ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		should: [ self parserClass parse: 'a ] a b )' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a ) a b )' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a b ] a  ]' ]
		raise: SmaCCParserError