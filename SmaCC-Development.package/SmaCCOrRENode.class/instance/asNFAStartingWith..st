private
asNFAStartingWith: aSmaCCNode
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	nodes
		do:
			[ :each | 
			| componentStart |
			componentStart := SmaCCNode new.
			startNode addEdgeTo: componentStart.
			(each asNFAStartingWith: componentStart) addEdgeTo: endNode ].
	^ endNode