generated
rhs: aJSExpressionNode
	self rhs notNil
		ifTrue: [ self rhs parent: nil ].
	rhs := aJSExpressionNode.
	self rhs notNil
		ifTrue: [ self rhs parent: self ]