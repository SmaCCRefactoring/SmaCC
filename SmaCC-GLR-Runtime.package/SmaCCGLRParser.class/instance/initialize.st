initialize-release
initialize
	super initialize.
	states := OrderedCollection new.
	parseAll := false.
	tryAllStates := false