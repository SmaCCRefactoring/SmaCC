generated
contextExpr: anASTContextExprNode
	self contextExpr notNil
		ifTrue: [ self contextExpr parent: nil ].
	contextExpr := anASTContextExprNode.
	self contextExpr notNil
		ifTrue: [ self contextExpr parent: self ]