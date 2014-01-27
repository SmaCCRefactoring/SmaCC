generated
setAccessor: aCSSetAccessorDeclarationNode
	self setAccessor notNil ifTrue: [self setAccessor parent: nil].
	setAccessor := aCSSetAccessorDeclarationNode.
	self setAccessor notNil ifTrue: [self setAccessor parent: self]