generated
constraintClauses: anOrderedCollection
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self