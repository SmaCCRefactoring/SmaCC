generated
setAccessor: aCSInterfacePropertyAccessorNode
	self setAccessor notNil ifTrue: [self setAccessor parent: nil].
	setAccessor := aCSInterfacePropertyAccessorNode.
	self setAccessor notNil ifTrue: [self setAccessor parent: self]