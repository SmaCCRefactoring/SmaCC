generated
trueExpression: aJavaExpressionNode
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aJavaExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]