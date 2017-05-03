*smacc-debugging-support
symbolIdForTransitionFrom: fromState to: toState
	| toValue |
	toValue := (toState bitShift: 2) bitOr: self shiftAction.
	self
		allActionsAndSymbolsForState: fromState
		do: [ :action :symbol | 
			| row |
			toValue = action
				ifTrue: [ ^ symbol ] ].
	^ 0