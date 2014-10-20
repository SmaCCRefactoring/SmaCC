generated
trueExpression: aJavaLambdaExpressionNode
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aJavaLambdaExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]