generated
thens: anOrderedCollection
	self setParents: self thens to: nil.
	thens := anOrderedCollection.
	self setParents: self thens to: self