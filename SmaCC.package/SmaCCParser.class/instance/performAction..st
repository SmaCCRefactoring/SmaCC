private
performAction: action
	| value actionType |
	actionType := action bitAnd: self actionMask.
	value := action bitShift: -2.
	actionType == self shiftAction
		ifTrue: [self shift: value]
		ifFalse: [actionType == self reduceAction ifTrue: [self reduce: value] ifFalse: [self handleError: value]]