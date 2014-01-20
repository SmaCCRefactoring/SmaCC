compiling
createChanges
	self removeOldMethods.
	self checkForEmptySymbols.
	self checkForUnusedSymbols.
	self compileScanner.
	self compileParser