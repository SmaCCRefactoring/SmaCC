generated
variable: aJavaExpressionNode
	self variable notNil ifTrue: [self variable parent: nil].
	variable := aJavaExpressionNode.
	self variable notNil ifTrue: [self variable parent: self]