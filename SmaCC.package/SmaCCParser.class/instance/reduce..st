private
reduce: anInteger 
	| reduceEntry items size |
	reduceEntry := self reduceTable at: anInteger.
	items := OrderedCollection new: (size := reduceEntry at: 2).
	size timesRepeat: 
			[items addFirst: nodeStack removeLast.
			stateStack removeLast].
	nodeStack add: (self performReduceMethod: (reduceEntry at: 3) with: items).
	stateStack add: ((self actionFor: (reduceEntry at: 1)) bitShift: -2)