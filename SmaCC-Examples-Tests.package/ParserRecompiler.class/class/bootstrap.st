public
bootstrap
	| scanner |
	scanner := self buildScanner: SmaCCDefinitionScanner andParser: SmaCCDefinitionParser.
	scanner compileChanges