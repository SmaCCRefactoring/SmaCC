generated
access: aCSMemberAccessNode
	self access notNil ifTrue: [self access parent: nil].
	access := aCSMemberAccessNode.
	self access notNil ifTrue: [self access parent: self]