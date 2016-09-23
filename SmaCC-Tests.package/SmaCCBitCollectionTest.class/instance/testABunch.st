tests
testABunch
	| collection count |
	collection := self newCollection.
	collection addAll: self byteSizeCollection.
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 256.
	self assert: collection size = 256.
	self assert: collection notEmpty.
	self
		assert:
			(self byteSizeCollection
				allSatisfy: [ :each | collection includes: each ]).
	self assert: collection asArray = self byteSizeCollection asArray