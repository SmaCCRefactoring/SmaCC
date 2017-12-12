generated
declarator: aCGLRDeclaratorNode
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]