public
testUnusedSymbols
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<letters> : \w+ ;
			<whitespace>: \s+	;
			%start Bar;
			begin : Foo;
			Foo :  <letters>;
			Bar : Baz ;
			Baz : "test" ;'.
	self
		assert: (
			[parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser'.
			true]
					on: SmaCCCompilationNotification
					do: [:ex | ex return: false]).
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<letters> : \w+ ;
			<whitespace>: \s+	;
			begin : Foo;
			Foo :  <letters>;
			Bar : Baz ;
			Baz : "test" ;'.
	self
		assert: (
			[parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser'.
			false]
					on: SmaCCCompilationNotification
					do: [:ex | ex return: true])