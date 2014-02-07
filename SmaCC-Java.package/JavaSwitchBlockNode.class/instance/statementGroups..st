generated
statementGroups: anOrderedCollection
	self setParents: self statementGroups to: nil.
	statementGroups := anOrderedCollection.
	self setParents: self statementGroups to: self