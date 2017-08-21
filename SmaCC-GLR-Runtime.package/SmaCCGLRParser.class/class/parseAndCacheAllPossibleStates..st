parsing
parseAndCacheAllPossibleStates: aString
	^ self cachedTrees at: (Array with: aString with: nil) ifAbsentPut: [ self parseAllPossibleStates: aString ]