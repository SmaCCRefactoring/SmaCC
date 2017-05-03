generated
fromExpr: aDelphiExpressionNode
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: nil ].
	fromExpr := aDelphiExpressionNode.
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: self ]