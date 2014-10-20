generated
joinInExpressions: anOrderedCollection
	self setParents: self joinInExpressions to: nil.
	joinInExpressions := anOrderedCollection.
	self setParents: self joinInExpressions to: self