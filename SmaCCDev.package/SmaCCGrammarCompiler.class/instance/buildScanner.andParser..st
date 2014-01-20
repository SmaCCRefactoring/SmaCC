initialize-release
buildScanner: scannerString andParser: parserString 
	| parser |
	scannerCompiler grammar: self grammar.
	scannerCompiler scannerDefinitionString: scannerString.
	parserDefinitionString := parserString.
	scannerCompiler parseTokens.
	parser := SmaCCGrammarParser on: (ReadStream on: parserString).
	parser grammar: grammar.
	parser parse