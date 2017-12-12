generated
initializer: aCGLRAbstractNode
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCGLRAbstractNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]