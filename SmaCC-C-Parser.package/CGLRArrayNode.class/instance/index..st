generated
index: aCGLRExpressionNode
	self index notNil
		ifTrue: [ self index parent: nil ].
	index := aCGLRExpressionNode.
	self index notNil
		ifTrue: [ self index parent: self ]