generated
variable: aDelphiVariableExpressionNode
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aDelphiVariableExpressionNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]