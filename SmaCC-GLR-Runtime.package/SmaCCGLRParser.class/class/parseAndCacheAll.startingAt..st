parsing
parseAndCacheAll: aString startingAt: anInteger
	^ self cachedTrees at: (Array with: aString with: anInteger) ifAbsentPut: [ self parseAll: aString startingAt: anInteger ]