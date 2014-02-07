generated
typeDeclarations: anOrderedCollection
	self setParents: self typeDeclarations to: nil.
	typeDeclarations := anOrderedCollection.
	self setParents: self typeDeclarations to: self