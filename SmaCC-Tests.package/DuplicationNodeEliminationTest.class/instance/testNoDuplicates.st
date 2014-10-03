tests
testNoDuplicates
	| node1 node2 node3 |
	node1 := SmaCCNode new.
	node1 action: 1.
	node2 := SmaCCNode new.
	node2 action: 2.
	node3 := SmaCCNode new.
	node3 action: 3.
	node1 addEdgeTo: node2 onCharacters: 'a'.
	node2 addEdgeTo: node3 onCharacters: 'a'.
	node3 addEdgeTo: node1 onCharacters: 'a'.
	node1 := node1 removeDuplicateNodes.
	self assert: node1 allStates size = 3.
	self assert: node1 transitions size = 1.
	self assert: (node1 action includes: 1).
	self assert: node1 transitions first transitionObjects asString = 'a'.
	node2 := node1 transitions first to.
	self deny: node1 = node2.
	self assert: node2 transitions size = 1.
	self assert: (node2 action includes: 2).
	self assert: node2 transitions first transitionObjects asString = 'a'.
	node3 := node2 transitions first to.
	self deny: node1 = node3.
	self deny: node2 = node3.
	self assert: node3 transitions size = 1.
	self assert: (node3 action includes: 3).
	self assert: node3 transitions first transitionObjects asString = 'a'.
	self assert: node3 transitions first to = node1