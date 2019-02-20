*smacc-debugging-roassal
roassalView
	^ self roassalViewForStack: (stateStack ifNil: [ Array with: self class defaultStartingState ])