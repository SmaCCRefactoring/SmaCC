generated
multExpr: anASTMultExprNode
	self multExpr notNil
		ifTrue: [ self multExpr parent: nil ].
	multExpr := anASTMultExprNode.
	self multExpr notNil
		ifTrue: [ self multExpr parent: self ]