generated
enumerators: anOrderedCollection
	self setParents: self enumerators to: nil.
	enumerators := anOrderedCollection.
	self setParents: self enumerators to: self