generated
addExpr: anASTAddExprNode
	self addExpr notNil
		ifTrue: [ self addExpr parent: nil ].
	addExpr := anASTAddExprNode.
	self addExpr notNil
		ifTrue: [ self addExpr parent: self ]