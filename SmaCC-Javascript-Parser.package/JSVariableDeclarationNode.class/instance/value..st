generated
value: aJSExpressionNode
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]