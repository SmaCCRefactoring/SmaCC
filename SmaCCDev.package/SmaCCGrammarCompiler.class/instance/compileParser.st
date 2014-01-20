compiling
compileParser
	self compileTransitionTable.
	self compileStartingStateIds.
	self compileReductionTable.
	self compileScannerClassIntoParser