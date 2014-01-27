generated
type: aCSTypeNode
	self type notNil ifTrue: [self type parent: nil].
	type := aCSTypeNode.
	self type notNil ifTrue: [self type parent: self]