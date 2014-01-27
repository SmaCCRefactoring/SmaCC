generated
getAccessor: aCSInterfacePropertyAccessorNode
	self getAccessor notNil ifTrue: [self getAccessor parent: nil].
	getAccessor := aCSInterfacePropertyAccessorNode.
	self getAccessor notNil ifTrue: [self getAccessor parent: self]