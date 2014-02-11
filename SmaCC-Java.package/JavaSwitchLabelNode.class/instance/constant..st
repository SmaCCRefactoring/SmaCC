generated
constant: aJavaExpressionNode
	self constant notNil
		ifTrue: [ self constant parent: nil ].
	constant := aJavaExpressionNode.
	self constant notNil
		ifTrue: [ self constant parent: self ]