accessing-types
nodeType: anIdentitySet
	| index |
	index := self returnedNodeIndex.
	^ index notNil
		ifTrue: [ (rhs at: index) nodeType: anIdentitySet ]
		ifFalse: [ self baseClassType ]