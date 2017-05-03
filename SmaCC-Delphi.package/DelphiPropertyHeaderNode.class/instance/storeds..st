generated
storeds: anOrderedCollection
	self setParents: self storeds to: nil.
	storeds := anOrderedCollection.
	self setParents: self storeds to: self