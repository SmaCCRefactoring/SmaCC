tests
testCopying
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := a copy.
	b remove: (self value: 5).
	self assert: (a includes: (self value: 5)).
	self deny: (b includes: (self value: 5))