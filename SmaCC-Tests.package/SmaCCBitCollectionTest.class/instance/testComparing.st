tests
testComparing
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := self newCollection.
	b addAll: self mediumCollection reverse.
	self assert: a hash = b hash.
	self assert: a = b.
	self supportsLargeValues
		ifFalse: [ ^ self ].
	b
		add: (self value: self largeValue);
		remove: (self value: self largeValue).
	self assert: a hash = b hash.
	self assert: a = b