generated
value: aCSExpressionNode
	self value notNil ifTrue: [self value parent: nil].
	value := aCSExpressionNode.
	self value notNil ifTrue: [self value parent: self]