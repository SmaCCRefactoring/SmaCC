generated
receiver: aJavaExpressionNode
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aJavaExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]