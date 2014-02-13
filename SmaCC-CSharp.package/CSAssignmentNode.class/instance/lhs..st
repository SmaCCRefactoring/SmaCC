generated
lhs: aCSExpressionNode
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aCSExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]