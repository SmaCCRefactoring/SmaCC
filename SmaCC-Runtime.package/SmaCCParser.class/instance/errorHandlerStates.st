error handling
errorHandlerStates
	^ stateStack
		collect:
			[ :each | 
			| action |
			action := self actionForState: each and: self errorTokenId.
			(action bitAnd: self actionMask) = 1
				ifTrue: [ action bitShift: -2 ]
				ifFalse: [ 0 ] ]