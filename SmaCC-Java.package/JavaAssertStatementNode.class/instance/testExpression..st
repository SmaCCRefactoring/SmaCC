generated
testExpression: aJavaLambdaExpressionNode
	self testExpression notNil
		ifTrue: [ self testExpression parent: nil ].
	testExpression := aJavaLambdaExpressionNode.
	self testExpression notNil
		ifTrue: [ self testExpression parent: self ]