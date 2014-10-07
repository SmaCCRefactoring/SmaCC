tests
testGrowing
	| collection count |
	collection := self newCollection.
	collection add: (self value: 256).
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 1.
	self assert: collection size = 1.
	self assert: collection notEmpty.
	self assert: (collection includes: (self value: 256)).
	self deny: (collection includes: (self value: 1)).
	collection remove: (self value: 256).
	self deny: (collection includes: (self value: 256)).
	self assert: collection size = 0