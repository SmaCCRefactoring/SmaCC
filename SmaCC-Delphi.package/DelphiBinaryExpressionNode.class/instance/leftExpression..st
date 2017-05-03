generated
leftExpression: aDelphiExpressionNode
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aDelphiExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]