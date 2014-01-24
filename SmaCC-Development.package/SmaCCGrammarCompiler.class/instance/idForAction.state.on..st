action
idForAction: aSmaCCAction state: anInteger on: aSmaCCSymbol
	| index preferredAction newStateIndex |
	(aSmaCCAction isAmbiguous and: [grammar isGLR])
		ifTrue:
			[index := codeGenerator
				ambiguousTableEntryFor:
					(aSmaCCAction actions
						collect:
							[:each | 
							self
								idForAction: each
								state: anInteger
								on: aSmaCCSymbol]) asSet asSortedCollection.
			^(index bitShift: 2) + 3]
		ifFalse:
			[preferredAction := aSmaCCAction preferredAction.
			preferredAction isShift
				ifTrue:
					[newStateIndex := shiftTable at: (self shiftTableKeyForIndex: anInteger symbol: aSmaCCSymbol).
					^(newStateIndex bitShift: 2) + preferredAction id].
			preferredAction isReduce ifTrue: [^((self reduceTableIndexFor: preferredAction) bitShift: 2) + preferredAction id].
			^aSmaCCAction id]