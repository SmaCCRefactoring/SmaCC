generated
declaration: aJavaLocalVariableDeclarationNode
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aJavaLocalVariableDeclarationNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]