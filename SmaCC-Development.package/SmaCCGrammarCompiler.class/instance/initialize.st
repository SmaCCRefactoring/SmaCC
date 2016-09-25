initialize-release
initialize
	super initialize.
	scannerCompiler := SmaCCScannerCompiler new.
	startingStateMap := Dictionary new.
	reduceTable := OrderedCollection new