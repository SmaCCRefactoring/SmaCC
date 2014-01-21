private
addStateTransitionsTo: aSmaCCNode
	| endNode |
	states isEmpty ifTrue: [^aSmaCCNode].
	endNode := SmaCCNode new.
	aSmaCCNode addEdgeTo: endNode onStates: states asSortedCollection asArray.
	^endNode