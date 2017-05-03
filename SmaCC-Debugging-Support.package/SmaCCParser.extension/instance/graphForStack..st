*smacc-debugging-support
graphForStack: aCollection
	| id name next graphNodeStack returnTable |
	graphNodeStack := OrderedCollection new.
	graphNodeStack add: (SmaCCGraphNode named: '' state: aCollection first parser: self).
	2 to: aCollection size do: [ :i | 
		id := self symbolIdForTransitionFrom: (aCollection at: i - 1) to: (aCollection at: i).
		name := self symbolNameFor: id.
		next := SmaCCGraphNode named: name state: (aCollection at: i) parser: self.
		graphNodeStack last followed: next.
		graphNodeStack add: next ].
	returnTable := self maxReturnSizeTable.
	self fillInGraphFromStack: graphNodeStack returnTable: returnTable size: 0.
	^ graphNodeStack first