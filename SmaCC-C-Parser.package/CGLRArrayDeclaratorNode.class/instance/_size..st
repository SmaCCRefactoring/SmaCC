generated
_size: aCGLRAbstractNode
	self _size notNil
		ifTrue: [ self _size parent: nil ].
	_size := aCGLRAbstractNode.
	self _size notNil
		ifTrue: [ self _size parent: self ]