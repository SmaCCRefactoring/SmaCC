tests
testRemoving
	| collection |
	collection := self newCollection.
	collection add: (self value: 1).
	self assert: collection size = 1.
	collection remove: (self value: 1).
	self assert: collection size = 0.
	self deny: (collection includes: (self value: 1))