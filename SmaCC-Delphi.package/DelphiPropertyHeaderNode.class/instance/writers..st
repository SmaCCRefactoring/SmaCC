generated
writers: anOrderedCollection
	self setParents: self writers to: nil.
	writers := anOrderedCollection.
	self setParents: self writers to: self