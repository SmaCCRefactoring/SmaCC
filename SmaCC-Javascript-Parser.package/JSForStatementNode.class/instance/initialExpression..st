generated
initialExpression: aJSExpressionNode
	self initialExpression notNil
		ifTrue: [ self initialExpression parent: nil ].
	initialExpression := aJSExpressionNode.
	self initialExpression notNil
		ifTrue: [ self initialExpression parent: self ]