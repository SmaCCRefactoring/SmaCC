generated
leftExpression: aJSExpressionNode
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aJSExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]