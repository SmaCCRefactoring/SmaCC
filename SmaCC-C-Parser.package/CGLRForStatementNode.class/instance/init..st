generated
init: aCGLRExpressionStatementNode
	self init notNil
		ifTrue: [ self init parent: nil ].
	init := aCGLRExpressionStatementNode.
	self init notNil
		ifTrue: [ self init parent: self ]