compiling
statesToMakeIntoMethodsFor: aSmaCCNode
	| allStates incoming methodStates |
	allStates := aSmaCCNode allStates.
	incoming := Dictionary new.
	allStates
		do: [ :each | 
			each transitions
				do: [ :edge | 
					each ~= edge to
						ifTrue: [ (incoming at: edge to ifAbsentPut: [ Set new ]) add: each ] ] ].
	methodStates := allStates asOrderedCollection
		select: [ :each | 
			aSmaCCNode = each
				or: [ each isTerminalNode not and: [ (incoming at: each ifAbsent: [ #() ]) size > 1 or: [ each transitions size > 10 ] ] ] ].
	^ methodStates asSortedCollection: [ :a :b | a id < b id ]