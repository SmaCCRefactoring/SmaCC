parsing
parseAndCacheAll: aString startingAt: anInteger
	cachedTrees isNil
		ifTrue: [ cachedTrees := Dictionary new ].
	^ cachedTrees
		at: (Array with: aString with: anInteger)
		ifAbsentPut: [ self parseAll: aString startingAt: anInteger ]