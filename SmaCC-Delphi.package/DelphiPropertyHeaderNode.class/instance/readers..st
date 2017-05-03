generated
readers: anOrderedCollection
	self setParents: self readers to: nil.
	readers := anOrderedCollection.
	self setParents: self readers to: self