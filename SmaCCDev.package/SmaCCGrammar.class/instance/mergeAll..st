private
mergeAll: anOrderedCollection
	| new first set |
	first := anOrderedCollection first.
	new := self newTerminalSymbolNamed: first name asUppercase.
	new regularExpression: first regularExpression.
	symbols add: new before: first.
	symbols removeAll: anOrderedCollection.
	set := anOrderedCollection asSet.
	self rhsDo: [:each | 1 to: each size do: [:i | (set includes: (each at: i)) ifTrue: [each collection at: i put: new]]]