initialize-release
initialize
	scannerCompiler := SmaCCScannerCompiler new.
	model := (RBNamespace new)
				name: 'Compile Scanner/Parser';
				yourself.
	startingStateMap := Dictionary new