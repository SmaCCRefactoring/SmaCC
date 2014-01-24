initialize
initialize
	super initialize.
	model := (RBNamespace new)
		name: 'Compile Scanner/Parser';
		yourself.
	self initializeIsExpressions.
	parseTreeCache := Dictionary new