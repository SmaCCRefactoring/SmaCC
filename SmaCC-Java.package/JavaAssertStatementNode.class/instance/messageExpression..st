generated
messageExpression: aJavaLambdaExpressionNode
	self messageExpression notNil
		ifTrue: [ self messageExpression parent: nil ].
	messageExpression := aJavaLambdaExpressionNode.
	self messageExpression notNil
		ifTrue: [ self messageExpression parent: self ]