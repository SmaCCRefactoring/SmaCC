private
buildScanner: aScannerClass andParser: aParserClass
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildDefinition: (self definitionFrom: aParserClass selector: #definitionComment).
	[ parserCompiler compileInto: aScannerClass andParser: aParserClass ]
		on: SmaCCCompilationNotification
		do: [ :notification | 
			Transcript
				show: notification messageText;
				cr.
			notification resume ].
	^ parserCompiler