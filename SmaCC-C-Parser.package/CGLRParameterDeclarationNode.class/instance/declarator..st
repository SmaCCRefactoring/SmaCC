generated
declarator: aCGLRAbstractNode
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRAbstractNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]