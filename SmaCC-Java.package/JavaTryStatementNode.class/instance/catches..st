generated
catches: anOrderedCollection
	self setParents: self catches to: nil.
	catches := anOrderedCollection.
	self setParents: self catches to: self