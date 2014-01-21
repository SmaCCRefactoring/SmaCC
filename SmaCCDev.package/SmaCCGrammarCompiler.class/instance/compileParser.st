compiling
compileParser
	self compileNodeClasses.
	(self codeGenerator)
		compileTransitionTable: self transitionTable;
		compileStartingStateIds: startingStateMap;
		compileReductionTable: self reduceTable;
		compileReductionActions;
		compileScannerClassIntoParser