private
matchedNodesFrom: stateCollection
	| indices |
	indices := IdentitySet new.
	stateCollection do: [ :each | indices addAll: (each action ifNil: [ #() ]) ].
	^ indices collect: [ :each | actionMap at: each ]