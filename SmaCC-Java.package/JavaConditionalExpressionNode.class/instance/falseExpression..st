generated
falseExpression: aJavaExpressionNode
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: nil ].
	falseExpression := aJavaExpressionNode.
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: self ]