generated
anothers: anOrderedCollection
	self setParents: self anothers to: nil.
	anothers := anOrderedCollection.
	self setParents: self anothers to: self