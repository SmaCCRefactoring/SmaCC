initialize-release
buildDefinition: definitionString
	| parser |
	scannerCompiler grammar: self grammar.
	parserDefinitionString := definitionString.
	parser := SmaCCDefinitionParser on: (ReadStream on: definitionString).
	parser scanner
		parseSourceSelector: self codeGenerator parseSourceSelector.
	parser grammar: grammar.
	parser parse.
	grammar finishBuilding