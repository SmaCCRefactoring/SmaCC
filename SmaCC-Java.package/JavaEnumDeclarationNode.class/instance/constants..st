generated
constants: anOrderedCollection
	self setParents: self constants to: nil.
	constants := anOrderedCollection.
	self setParents: self constants to: self