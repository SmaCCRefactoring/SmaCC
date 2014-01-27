generated
rankSpecifiers: anOrderedCollection
	self setParents: self rankSpecifiers to: nil.
	rankSpecifiers := anOrderedCollection.
	self setParents: self rankSpecifiers to: self