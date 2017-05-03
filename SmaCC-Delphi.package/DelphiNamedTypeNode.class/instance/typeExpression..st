generated
typeExpression: aDelphiExpressionNode
	self typeExpression notNil
		ifTrue: [ self typeExpression parent: nil ].
	typeExpression := aDelphiExpressionNode.
	self typeExpression notNil
		ifTrue: [ self typeExpression parent: self ]