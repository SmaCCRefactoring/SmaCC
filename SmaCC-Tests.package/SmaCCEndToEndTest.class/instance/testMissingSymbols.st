tests
testMissingSymbols
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	self
		should: [ parserCompiler
				buildDefinition:
					'<letters> : \w+ ;
			<whitespace>: \s+	;
			%start Bar;
			begin : Foo;
			Foo :  <letter>;
			Bar : Baz ;
			Baz : "test" ;' ]
		raise: SmaCCParserError