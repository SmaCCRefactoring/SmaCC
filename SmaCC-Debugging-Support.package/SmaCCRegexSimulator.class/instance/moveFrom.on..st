private
moveFrom: stateCollection on: aCharacter
	| newStates |
	newStates := IdentitySet new.
	stateCollection
		do: [ :each | 
			each transitions
				do: [ :edge | 
					(edge includes: aCharacter)
						ifTrue: [ newStates add: edge to ] ] ].
	^ self expandEpsilonAndSymbolTransitions: newStates