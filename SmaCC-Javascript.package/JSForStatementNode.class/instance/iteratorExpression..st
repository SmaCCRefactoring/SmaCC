generated
iteratorExpression: aJSExpressionNode
	self iteratorExpression notNil
		ifTrue: [ self iteratorExpression parent: nil ].
	iteratorExpression := aJSExpressionNode.
	self iteratorExpression notNil
		ifTrue: [ self iteratorExpression parent: self ]