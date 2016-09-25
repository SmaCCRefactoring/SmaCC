initialize-release
initialize
	super initialize.
	tokens := Dictionary new.
	states := Set with: self defaultState.
	excludeStates := Set new