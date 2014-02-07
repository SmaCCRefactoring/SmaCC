generated
variableDeclarations: anOrderedCollection
	self setParents: self variableDeclarations to: nil.
	variableDeclarations := anOrderedCollection.
	self setParents: self variableDeclarations to: self