generated
expression: aCGLRExpressionNode
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCGLRExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]