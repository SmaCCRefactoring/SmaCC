running
matchesOn: aString do: aBlock
	| states |
	states := self expandEpsilonAndSymbolTransitions: (IdentitySet with: nfa).
	aBlock value: 0 value: (self matchedNodesFrom: states).
	1 to: aString size do: [ :i | 
		states := self moveFrom: states on: (aString at: i).
		states isEmpty
			ifTrue: [ ^ aBlock value: i value: nil ].
		aBlock value: i value: (self matchedNodesFrom: states) ]