generated
constant: aCSExpressionNode
	self constant notNil
		ifTrue: [ self constant parent: nil ].
	constant := aCSExpressionNode.
	self constant notNil
		ifTrue: [ self constant parent: self ]