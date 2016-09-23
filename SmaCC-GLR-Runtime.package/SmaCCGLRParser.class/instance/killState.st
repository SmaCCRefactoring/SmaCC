private
killState
	states remove: currentState.
	states isEmpty
		ifTrue: [ self handleError: 0 ].
	(states size = 1 and: [ parseAll not ])
		ifTrue: [ states first runDeferredActionsFor: self ]