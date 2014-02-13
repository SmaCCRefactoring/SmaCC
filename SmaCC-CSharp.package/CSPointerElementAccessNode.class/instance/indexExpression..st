generated
indexExpression: aCSExpressionNode
	self indexExpression notNil
		ifTrue: [ self indexExpression parent: nil ].
	indexExpression := aCSExpressionNode.
	self indexExpression notNil
		ifTrue: [ self indexExpression parent: self ]