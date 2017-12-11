generated
lvalue: aCGLRAbstractNode
	self lvalue notNil
		ifTrue: [ self lvalue parent: nil ].
	lvalue := aCGLRAbstractNode.
	self lvalue notNil
		ifTrue: [ self lvalue parent: self ]