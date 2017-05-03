generated
formatExpression: aDelphiExpressionNode
	self formatExpression notNil
		ifTrue: [ self formatExpression parent: nil ].
	formatExpression := aDelphiExpressionNode.
	self formatExpression notNil
		ifTrue: [ self formatExpression parent: self ]