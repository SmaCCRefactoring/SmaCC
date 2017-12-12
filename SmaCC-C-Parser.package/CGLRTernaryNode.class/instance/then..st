generated
then: aCGLRExpressionNode
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aCGLRExpressionNode.
	self then notNil
		ifTrue: [ self then parent: self ]