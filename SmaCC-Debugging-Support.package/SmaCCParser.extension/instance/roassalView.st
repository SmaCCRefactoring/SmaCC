*smacc-debugging-support
roassalView
	^ self roassalViewForStack: (stateStack ifNil: [ Array with: self class defaultStartingState ])