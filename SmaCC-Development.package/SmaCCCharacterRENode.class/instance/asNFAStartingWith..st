private
asNFAStartingWith: aSmaCCNode
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	startNode addEdgeTo: endNode onCharacters: characters.
	^ endNode