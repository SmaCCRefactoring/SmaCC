private
reduce: anInteger
	| reduceEntry items size |
	reduceEntry := self reduceTable at: anInteger.
	items := Array new: (size := reduceEntry at: 2).
	nodeStack size < size
		ifTrue: [ self killState.
			^ currentToken := nil ].
	size to: 1 by: -1 do:
		[ :i | 
		items at: i put: self popNodeStack.
		stateStack removeLast ].
	nodeStack
		addLast: (self performReduceMethod: (reduceEntry at: 3) with: items).
	stateStack
		addLast: ((self actionFor: (reduceEntry at: 1)) bitShift: -2)