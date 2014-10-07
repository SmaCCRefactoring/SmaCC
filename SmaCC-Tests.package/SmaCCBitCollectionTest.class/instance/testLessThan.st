tests
testLessThan
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := self newCollection.
	b addAll: self mediumCollection.
	self deny: a < b.
	self deny: a > b.
	self assert: a <= b.
	self assert: a >= b.
	b remove: (self value: 1).
	self assert: a < b.
	self deny: a > b.
	self assert: a <= b.
	self deny: a >= b.
	b add: (self value: 1).
	b remove: (self value: 2).
	self assert: a < b.
	self deny: a > b.
	self assert: a <= b.
	self deny: a >= b.
	self supportsLargeValues
		ifFalse: [ ^ false ].
	b
		add: (self value: 2);
		remove: (self value: 1000).
	self deny: a < b.
	self assert: a > b.
	self deny: a <= b.
	self assert: a >= b