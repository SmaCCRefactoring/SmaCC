generated
xorExpr: anASTXorExprNode
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: nil ].
	xorExpr := anASTXorExprNode.
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: self ]