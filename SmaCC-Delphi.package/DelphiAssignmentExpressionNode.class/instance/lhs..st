generated
lhs: aDelphiExpressionNode
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aDelphiExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]