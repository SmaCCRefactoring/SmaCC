generated
primary: aJavaExpressionNode
	self primary notNil ifTrue: [self primary parent: nil].
	primary := aJavaExpressionNode.
	self primary notNil ifTrue: [self primary parent: self]