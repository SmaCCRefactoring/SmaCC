generated
andExpr: anASTAndExprNode
	self andExpr notNil
		ifTrue: [ self andExpr parent: nil ].
	andExpr := anASTAndExprNode.
	self andExpr notNil
		ifTrue: [ self andExpr parent: self ]