generated
identifier: aCSQualifiedIdentifierNode
	self identifier notNil ifTrue: [self identifier parent: nil].
	identifier := aCSQualifiedIdentifierNode.
	self identifier notNil ifTrue: [self identifier parent: self]