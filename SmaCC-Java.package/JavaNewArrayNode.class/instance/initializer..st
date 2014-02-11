generated
initializer: aJavaArrayInitializerNode
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aJavaArrayInitializerNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]