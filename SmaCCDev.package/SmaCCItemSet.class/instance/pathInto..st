accessing
pathInto: anOrderedCollection
	| item |
	self previousState isNil ifTrue: [^self].
	self previousState pathInto: anOrderedCollection.
	item := self detect: [:each | each location > 1].
	anOrderedCollection add: (item rhs at: item location - 1)