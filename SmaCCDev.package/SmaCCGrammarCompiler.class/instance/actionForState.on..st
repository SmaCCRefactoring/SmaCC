action table
actionForState: anInteger on: aSmaCCSymbol 
	| action newStateIndex |
	action := (itemSets at: anInteger) action: aSmaCCSymbol
				prefer: (grammar preferredActionFor: aSmaCCSymbol).
	action isShift 
		ifTrue: 
			[newStateIndex := shiftTable 
						at: (Array with: anInteger with: aSmaCCSymbol).
			^(newStateIndex bitShift: 2) + action id].
	action isReduce 
		ifTrue: 
			[^((grammar reduceTableIndexFor: action symbol rhs: action rhs) 
				bitShift: 2) + action id].
	^action id