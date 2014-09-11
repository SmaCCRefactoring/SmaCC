generated
trailers: anOrderedCollection
	self setParents: self trailers to: nil.
	trailers := anOrderedCollection.
	self setParents: self trailers to: self