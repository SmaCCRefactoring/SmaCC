action table
indexOfState: newState 
	| newStateIndex |
	newStateIndex := itemSets indexOf: newState.
	newStateIndex = 0 
		ifTrue: 
			[itemSets add: newState.
			newStateIndex := itemSets size]
		ifFalse: [(itemSets at: newStateIndex) mergeWith: newState].
	^newStateIndex