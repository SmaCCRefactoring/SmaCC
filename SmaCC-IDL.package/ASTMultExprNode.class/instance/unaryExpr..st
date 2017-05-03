generated
unaryExpr: anASTUnaryExprNode
	self unaryExpr notNil
		ifTrue: [ self unaryExpr parent: nil ].
	unaryExpr := anASTUnaryExprNode.
	self unaryExpr notNil
		ifTrue: [ self unaryExpr parent: self ]