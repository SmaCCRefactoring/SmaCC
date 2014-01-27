generated
type: aCSArrayTypeNode
	self type notNil ifTrue: [self type parent: nil].
	type := aCSArrayTypeNode.
	self type notNil ifTrue: [self type parent: self]