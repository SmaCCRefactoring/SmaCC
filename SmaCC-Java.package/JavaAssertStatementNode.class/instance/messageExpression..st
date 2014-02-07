generated
messageExpression: aJavaExpressionNode
	self messageExpression notNil ifTrue: [self messageExpression parent: nil].
	messageExpression := aJavaExpressionNode.
	self messageExpression notNil ifTrue: [self messageExpression parent: self]