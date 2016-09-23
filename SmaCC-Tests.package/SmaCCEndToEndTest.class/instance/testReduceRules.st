tests
testReduceRules
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<char> : [a-zA-Z] ; 
			<ws> : \s ;
			Start ::= Chars {#liftFirstValue:};
			Chars : WS A WS {#liftSecondValue:};
			A : WS WS C {#liftLastValue:} | C WS {#liftLastValue:};
			WS : <ws> {#nil};
			C : <char> {#stringValue:};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: ' a  ') isNil.
	self assert: (self parserClass parse: '   a ') = 'a'