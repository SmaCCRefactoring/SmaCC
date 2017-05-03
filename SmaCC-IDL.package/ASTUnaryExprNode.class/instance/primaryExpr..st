generated
primaryExpr: anASTPrimaryExprNode
	self primaryExpr notNil
		ifTrue: [ self primaryExpr parent: nil ].
	primaryExpr := anASTPrimaryExprNode.
	self primaryExpr notNil
		ifTrue: [ self primaryExpr parent: self ]