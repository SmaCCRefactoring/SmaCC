private
asNFAStartingWith: aSmaCCNode
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	(nodes
		inject: startNode
		into: [ :sum :each | each asNFAStartingWith: sum ])
		addEdgeTo: endNode.
	^ endNode