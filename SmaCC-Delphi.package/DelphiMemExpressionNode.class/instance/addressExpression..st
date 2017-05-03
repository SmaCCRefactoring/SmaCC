generated
addressExpression: aDelphiExpressionNode
	self addressExpression notNil
		ifTrue: [ self addressExpression parent: nil ].
	addressExpression := aDelphiExpressionNode.
	self addressExpression notNil
		ifTrue: [ self addressExpression parent: self ]