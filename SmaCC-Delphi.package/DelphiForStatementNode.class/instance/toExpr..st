generated
toExpr: aDelphiExpressionNode
	self toExpr notNil
		ifTrue: [ self toExpr parent: nil ].
	toExpr := aDelphiExpressionNode.
	self toExpr notNil
		ifTrue: [ self toExpr parent: self ]