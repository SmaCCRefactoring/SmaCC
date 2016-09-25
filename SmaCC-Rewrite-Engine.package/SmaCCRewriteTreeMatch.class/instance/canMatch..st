testing
canMatch: aClass
	^ self trees
		anySatisfy: [ :each | each class == aClass or: [ each isKindOf: SmaCCPatternNode ] ]