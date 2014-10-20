generated
joinOnExpressions: anOrderedCollection
	self setParents: self joinOnExpressions to: nil.
	joinOnExpressions := anOrderedCollection.
	self setParents: self joinOnExpressions to: self