generated
rightExpression: aDelphiExpressionNode
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: nil ].
	rightExpression := aDelphiExpressionNode.
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: self ]