generated
smalls: anOrderedCollection
	self setParents: self smalls to: nil.
	smalls := anOrderedCollection.
	self setParents: self smalls to: self