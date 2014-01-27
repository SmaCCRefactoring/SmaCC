generated
declaration: aCSDeclarationNode
	self declaration notNil ifTrue: [self declaration parent: nil].
	declaration := aCSDeclarationNode.
	self declaration notNil ifTrue: [self declaration parent: self]