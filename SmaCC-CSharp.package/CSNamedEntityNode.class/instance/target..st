generated
target: aCSExpressionNode
	self target notNil
		ifTrue: [ self target parent: nil ].
	target := aCSExpressionNode.
	self target notNil
		ifTrue: [ self target parent: self ]