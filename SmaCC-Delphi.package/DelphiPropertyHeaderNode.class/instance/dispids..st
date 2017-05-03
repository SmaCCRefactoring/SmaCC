generated
dispids: anOrderedCollection
	self setParents: self dispids to: nil.
	dispids := anOrderedCollection.
	self setParents: self dispids to: self