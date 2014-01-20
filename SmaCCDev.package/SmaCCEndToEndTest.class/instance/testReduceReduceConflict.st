public
testReduceReduceConflict
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<letter> : \w ;
			<whitespace>: \s+	;
			begin : Foo <letter> {true} | Bar <letter> {false};
			Foo :  ;
			Bar : ;'.
	self
		assert: (
			[parserCompiler compileInto: 'TestScanner'
				andParser: 'TestParser'.
			false]
					on: SmaCCCompilationNotification
					do: 
						[:ex |
						('*Reduce/Reduce*' match: ex messageText)
							ifTrue: [ex return: true]
							ifFalse: [ex resume: nil]])