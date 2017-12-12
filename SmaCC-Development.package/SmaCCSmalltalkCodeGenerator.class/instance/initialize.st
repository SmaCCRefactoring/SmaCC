initialize-release
initialize
	super initialize.
	model := RBNamespace new
		name: 'Compile Scanner/Parser';
		yourself.
	parseTreeCache := Dictionary new