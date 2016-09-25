generated
lhs: aJSExpressionNode
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aJSExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]