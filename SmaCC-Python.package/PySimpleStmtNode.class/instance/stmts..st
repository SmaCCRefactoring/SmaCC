generated
stmts: anOrderedCollection
	self setParents: self stmts to: nil.
	stmts := anOrderedCollection.
	self setParents: self stmts to: self