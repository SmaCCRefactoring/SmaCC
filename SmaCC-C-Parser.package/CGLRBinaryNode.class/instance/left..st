generated
left: aCGLRAbstractNode
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aCGLRAbstractNode.
	self left notNil
		ifTrue: [ self left parent: self ]