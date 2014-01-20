tests
testSimpleDuplicateWithEdges
	| node1 node2 node3 |
	node1 := SmaCCNode new.
	node2 := SmaCCNode new.
	node2 action: 2.
	node3 := SmaCCNode new.
	node3 action: 2.
	node1 addEdgeTo: node2 onCharacters: 'a'.
	node1 addEdgeTo: node3 onCharacters: 'b'.
	node2 addEdgeTo: node1 onCharacters: 'c'.
	node3 addEdgeTo: node1 onCharacters: 'c'.
	node1 := node1 removeDuplicateNodes.
	self assert: node1 allStates size = 2.
	self assert: node1 transitions size = 1.
	self assert: node1 transitions first transitionObjects = 'ab'.
	node2 := node1 transitions first to.
	self deny: node1 = node2.
	self assert: node2 transitions size = 1.
	self assert: (node2 action includes: 2).
	self assert: node2 transitions first transitionObjects = 'c'.
	self assert: node2 transitions first to = node1