generated
definitions: anOrderedCollection
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self