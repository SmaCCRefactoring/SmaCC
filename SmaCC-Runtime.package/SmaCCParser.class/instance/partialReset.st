initialize-release
partialReset
	nodeStack := OrderedCollection new.
	stateStack := OrderedCollection with: self class defaultStartingState.
	errorToken := nil