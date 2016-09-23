generated
assignments: anOrderedCollection
	self setParents: self assignments to: nil.
	assignments := anOrderedCollection.
	self setParents: self assignments to: self