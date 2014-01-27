generated
initializer: aCSConstructorInitializerNode
	self initializer notNil ifTrue: [self initializer parent: nil].
	initializer := aCSConstructorInitializerNode.
	self initializer notNil ifTrue: [self initializer parent: self]