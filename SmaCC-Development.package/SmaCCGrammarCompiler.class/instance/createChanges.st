compiling
createChanges
	self codeGenerator removeOldMethods.
	self checkForEmptySymbols.
	self checkForUnusedSymbols.
	self compileScanner.
	self compileParser.
	self codeGenerator compileDefinitionComment: parserDefinitionString