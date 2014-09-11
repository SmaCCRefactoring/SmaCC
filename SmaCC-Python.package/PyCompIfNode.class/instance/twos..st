generated
twos: anOrderedCollection
	self setParents: self twos to: nil.
	twos := anOrderedCollection.
	self setParents: self twos to: self