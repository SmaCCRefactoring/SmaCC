generated
value: aJavaExpressionNode
	self value notNil ifTrue: [self value parent: nil].
	value := aJavaExpressionNode.
	self value notNil ifTrue: [self value parent: self]