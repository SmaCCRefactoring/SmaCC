generated
expr: aCGLRExpressionNode
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aCGLRExpressionNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]