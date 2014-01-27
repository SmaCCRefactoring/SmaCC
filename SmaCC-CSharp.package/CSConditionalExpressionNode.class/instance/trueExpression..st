generated
trueExpression: aCSExpressionNode
	self trueExpression notNil ifTrue: [self trueExpression parent: nil].
	trueExpression := aCSExpressionNode.
	self trueExpression notNil ifTrue: [self trueExpression parent: self]