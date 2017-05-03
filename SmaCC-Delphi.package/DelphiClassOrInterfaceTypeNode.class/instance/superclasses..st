generated
superclasses: anOrderedCollection
	self setParents: self superclasses to: nil.
	superclasses := anOrderedCollection.
	self setParents: self superclasses to: self