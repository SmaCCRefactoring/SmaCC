generated
falseExpression: aJSExpressionNode
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: nil ].
	falseExpression := aJSExpressionNode.
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: self ]