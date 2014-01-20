testing
testLALRErrorHandler
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<whitespace> : \s+ ;'
		andParser: 'Start : Foo "]" Foo ")";
					Foo : "a" Bar ;
					Bar : "b" | error ;'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self should: [TestParser parse: 'a ] a b )'] raise: SmaCCParserError.
	self should: [TestParser parse: 'a ) a b )'] raise: SmaCCParserError.
	self should: [TestParser parse: 'a b ] a  ]'] raise: SmaCCParserError