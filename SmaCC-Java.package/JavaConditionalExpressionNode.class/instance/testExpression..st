generated
testExpression: aJavaExpressionNode
	self testExpression notNil ifTrue: [self testExpression parent: nil].
	testExpression := aJavaExpressionNode.
	self testExpression notNil ifTrue: [self testExpression parent: self]