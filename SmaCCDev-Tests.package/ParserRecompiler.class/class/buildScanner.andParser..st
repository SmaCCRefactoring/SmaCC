private
buildScanner: aScannerClass andParser: aParserClass
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildScanner: (self
			definitionFrom: aScannerClass
			selector: #scannerDefinitionComment)
		andParser: (self
			definitionFrom: aParserClass
			selector: #parserDefinitionComment).
	parserCompiler
		scannerClass: aScannerClass;
		parserClass: aParserClass.
	[ parserCompiler
		createChanges;
		compileDefinitionComments ]
			on: SmaCCCompilationNotification
			do: [ :notification |
				Transcript show: notification messageText; cr.
				notification resume ].
	^ parserCompiler