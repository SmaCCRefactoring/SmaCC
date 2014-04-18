compiling
allTransitionsWith: selectedStates
	"Count effective number of transitions for that node when compiling; this is where the hard limit on method length can be determined."

	^ self allTransitionsWith: selectedStates visited: Set new