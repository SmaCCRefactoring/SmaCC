generated
groupByExpressions: anOrderedCollection
	self setParents: self groupByExpressions to: nil.
	groupByExpressions := anOrderedCollection.
	self setParents: self groupByExpressions to: self