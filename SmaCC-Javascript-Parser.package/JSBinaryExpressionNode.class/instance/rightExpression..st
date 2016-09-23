generated
rightExpression: aJSExpressionNode
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: nil ].
	rightExpression := aJSExpressionNode.
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: self ]