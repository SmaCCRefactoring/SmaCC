generated
key: aJSNameExpressionNode
	self key notNil
		ifTrue: [ self key parent: nil ].
	key := aJSNameExpressionNode.
	self key notNil
		ifTrue: [ self key parent: self ]