generated
constructorInvocation: aJavaProgramNode
	self constructorInvocation notNil
		ifTrue: [ self constructorInvocation parent: nil ].
	constructorInvocation := aJavaProgramNode.
	self constructorInvocation notNil
		ifTrue: [ self constructorInvocation parent: self ]