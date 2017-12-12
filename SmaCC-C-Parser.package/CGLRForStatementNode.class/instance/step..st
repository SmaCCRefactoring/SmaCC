generated
step: aCGLRExpressionNode
	self step notNil
		ifTrue: [ self step parent: nil ].
	step := aCGLRExpressionNode.
	self step notNil
		ifTrue: [ self step parent: self ]