generated
type: aCSPointerTypeNode
	self type notNil ifTrue: [self type parent: nil].
	type := aCSPointerTypeNode.
	self type notNil ifTrue: [self type parent: self]