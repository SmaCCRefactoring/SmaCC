converting
orderNodesWithId: anInteger map: aDictionary
	anInteger <= id ifTrue: [^self].
	id := aDictionary at: id ifAbsentPut: [self getId].
	self sortedTransitions do: [:each | each to orderNodesWithId: anInteger map: aDictionary]