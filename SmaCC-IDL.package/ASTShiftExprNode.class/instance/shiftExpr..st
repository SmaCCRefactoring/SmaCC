generated
shiftExpr: anASTShiftExprNode
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: nil ].
	shiftExpr := anASTShiftExprNode.
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: self ]