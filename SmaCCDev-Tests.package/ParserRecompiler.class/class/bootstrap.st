public
bootstrap
	| scanner grammer |
	scanner := self
		buildScanner: SmaCCScannerScanner
		andParser: SmaCCScannerParser.
	grammer := self
		buildScanner: SmaCCGrammarScanner
		andParser: SmaCCGrammarParser.
	scanner compileChanges.
	grammer compileChanges