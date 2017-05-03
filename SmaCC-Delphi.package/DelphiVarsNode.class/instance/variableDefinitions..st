generated
variableDefinitions: anOrderedCollection
	self setParents: self variableDefinitions to: nil.
	variableDefinitions := anOrderedCollection.
	self setParents: self variableDefinitions to: self