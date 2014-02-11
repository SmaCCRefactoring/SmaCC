generated
leftExpression: aJavaExpressionNode
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aJavaExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]