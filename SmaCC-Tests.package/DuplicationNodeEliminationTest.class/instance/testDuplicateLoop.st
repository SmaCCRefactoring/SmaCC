tests
testDuplicateLoop
	| node1 node2 node3 |
	node1 := SmaCCNode new.
	node1 action: 1.
	node2 := SmaCCNode new.
	node2 action: 1.
	node3 := SmaCCNode new.
	node3 action: 1.
	node1 addEdgeTo: node2 onCharacters: 'a'.
	node2 addEdgeTo: node3 onCharacters: 'a'.
	node3 addEdgeTo: node1 onCharacters: 'a'.
	node1 := node1 removeDuplicateNodes.
	self assert: node1 allStates size = 1.
	self assert: node1 transitions size = 1.
	self assert: (node1 action includes: 1).
	self assert: node1 transitions first transitionObjects asString = 'a'.
	self assert: node1 transitions first to = node1