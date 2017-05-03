generated
exports: anOrderedCollection
	self setParents: self exports to: nil.
	exports := anOrderedCollection.
	self setParents: self exports to: self