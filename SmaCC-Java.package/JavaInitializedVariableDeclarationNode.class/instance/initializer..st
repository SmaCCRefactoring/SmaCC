generated
initializer: aJavaProgramNode
	self initializer notNil ifTrue: [self initializer parent: nil].
	initializer := aJavaProgramNode.
	self initializer notNil ifTrue: [self initializer parent: self]