generated
baseExpression: aCSExpressionNode
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: nil ].
	baseExpression := aCSExpressionNode.
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: self ]