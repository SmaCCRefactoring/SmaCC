generated
raisesExpr: anASTRaisesExprNode
	self raisesExpr notNil
		ifTrue: [ self raisesExpr parent: nil ].
	raisesExpr := anASTRaisesExprNode.
	self raisesExpr notNil
		ifTrue: [ self raisesExpr parent: self ]