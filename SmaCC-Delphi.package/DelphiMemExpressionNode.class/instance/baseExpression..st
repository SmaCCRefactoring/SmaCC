generated
baseExpression: aDelphiExpressionNode
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: nil ].
	baseExpression := aDelphiExpressionNode.
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: self ]