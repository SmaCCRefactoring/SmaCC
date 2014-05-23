generated
tests: anOrderedCollection
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self