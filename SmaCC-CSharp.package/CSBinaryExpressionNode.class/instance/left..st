generated
left: aCSExpressionNode
	self left notNil ifTrue: [self left parent: nil].
	left := aCSExpressionNode.
	self left notNil ifTrue: [self left parent: self]