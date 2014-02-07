generated
baseType: aJavaProgramNode
	self baseType notNil ifTrue: [self baseType parent: nil].
	baseType := aJavaProgramNode.
	self baseType notNil ifTrue: [self baseType parent: self]