generated
joinEqualsExpressions: anOrderedCollection
	self setParents: self joinEqualsExpressions to: nil.
	joinEqualsExpressions := anOrderedCollection.
	self setParents: self joinEqualsExpressions to: self