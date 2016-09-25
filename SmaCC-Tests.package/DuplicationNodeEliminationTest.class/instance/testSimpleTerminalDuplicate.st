tests
testSimpleTerminalDuplicate
	| node1 node2 node3 |
	node1 := SmaCCNode new.
	node2 := SmaCCNode new.
	node2 action: 2.
	node3 := SmaCCNode new.
	node3 action: 2.
	node1 addEdgeTo: node2 onCharacters: 'a'.
	node1 addEdgeTo: node3 onCharacters: 'b'.
	node1 := node1 removeDuplicateNodes.
	self assert: node1 allStates size = 2.
	self assert: node1 transitions size = 1.
	self
		assert: node1 transitions first transitionObjects asString = 'ab'.
	node2 := node1 transitions first to.
	self deny: node1 = node2.
	self assert: node2 transitions isEmpty.
	self assert: (node2 action includes: 2)