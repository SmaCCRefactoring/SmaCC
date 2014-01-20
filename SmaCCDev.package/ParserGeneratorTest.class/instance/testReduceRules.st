testing
testReduceRules
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '
					<char> : [a-zA-Z] ; 
					<ws> : \s ;'
		andParser: '
				Start ::= Chars {#liftFirstValue:};
				Chars : WS A WS {#liftSecondValue:};
				A : WS WS C {#liftLastValue:} | C WS {#liftLastValue:};
				WS : <ws> {#nil};
				C : <char> {#stringValue:};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: ' a  ') = nil.
	self assert: (TestParser parse: '   a ') = 'a'