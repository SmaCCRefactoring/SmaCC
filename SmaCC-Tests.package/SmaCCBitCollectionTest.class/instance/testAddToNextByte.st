tests
testAddToNextByte
	| collection count |
	collection := self newCollection.
	collection add: (self value: 8).
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 1.
	self assert: collection size = 1.
	self assert: collection notEmpty.
	self assert: (collection includes: (self value: 8)).
	self deny: (collection includes: (self value: 7)).
	self deny: (collection includes: (self value: 9))