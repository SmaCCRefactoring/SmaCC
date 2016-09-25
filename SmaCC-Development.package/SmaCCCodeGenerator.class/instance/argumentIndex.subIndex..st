code generation templates
argumentIndex: anInteger subIndex: subIndex
	^ self
		at: (self cast: (self argumentIndex: anInteger) to: self collectionType)
		index: subIndex