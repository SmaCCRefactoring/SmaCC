generated
orExpr: anASTOrExprNode
	self orExpr notNil
		ifTrue: [ self orExpr parent: nil ].
	orExpr := anASTOrExprNode.
	self orExpr notNil
		ifTrue: [ self orExpr parent: self ]