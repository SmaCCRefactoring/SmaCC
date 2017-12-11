generated
right: aCGLRAbstractNode
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := aCGLRAbstractNode.
	self right notNil
		ifTrue: [ self right parent: self ]