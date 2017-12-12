generated
direct: aCGLRAbstractNode
	self direct notNil
		ifTrue: [ self direct parent: nil ].
	direct := aCGLRAbstractNode.
	self direct notNil
		ifTrue: [ self direct parent: self ]