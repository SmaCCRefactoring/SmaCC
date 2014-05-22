generated
inits: anOrderedCollection
	self setParents: self inits to: nil.
	inits := anOrderedCollection.
	self setParents: self inits to: self