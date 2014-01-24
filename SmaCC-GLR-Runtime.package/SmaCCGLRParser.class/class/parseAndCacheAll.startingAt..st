parsing
parseAndCacheAll: aString startingAt: anInteger
	cachedTrees isNil ifTrue: [cachedTrees := Dictionary new].
	^cachedTrees at: aString ifAbsentPut: [self parseAll: aString startingAt: anInteger]