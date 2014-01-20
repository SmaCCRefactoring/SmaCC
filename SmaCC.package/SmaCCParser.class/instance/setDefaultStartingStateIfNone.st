private
setDefaultStartingStateIfNone
	stateStack isNil 
		ifTrue: [self setStartingState: self class defaultStartingState]