generated
rhs: aCSExpressionNode
	self rhs notNil
		ifTrue: [ self rhs parent: nil ].
	rhs := aCSExpressionNode.
	self rhs notNil
		ifTrue: [ self rhs parent: self ]