generated
_pointer: aCGLRAbstractNode
	self _pointer notNil
		ifTrue: [ self _pointer parent: nil ].
	_pointer := aCGLRAbstractNode.
	self _pointer notNil
		ifTrue: [ self _pointer parent: self ]