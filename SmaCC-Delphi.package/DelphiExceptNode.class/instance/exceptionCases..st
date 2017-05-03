generated
exceptionCases: anOrderedCollection
	self setParents: self exceptionCases to: nil.
	exceptionCases := anOrderedCollection.
	self setParents: self exceptionCases to: self