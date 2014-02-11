generated-reduction actions
reduceActionForArray3: nodes
	(nodes at: 2) stopPosition + 1 = (nodes at: 3) startPosition
		ifTrue: [ (nodes at: 1) nextPut: ((nodes at: 2) value , ':') asSymbol ]
		ifFalse: [ 
			(nodes at: 1)
				nextPut: (nodes at: 2) value asSymbol;
				nextPut: #':' ].
	self position: (nodes at: 3) startPosition.
	currentToken := nil.
	^ nodes at: 1