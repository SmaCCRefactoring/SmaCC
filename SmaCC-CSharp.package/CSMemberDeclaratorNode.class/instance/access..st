generated
access: aCSExpressionNode
	self access notNil
		ifTrue: [ self access parent: nil ].
	access := aCSExpressionNode.
	self access notNil
		ifTrue: [ self access parent: self ]