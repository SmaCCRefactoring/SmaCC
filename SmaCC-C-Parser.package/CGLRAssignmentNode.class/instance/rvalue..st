generated
rvalue: aCGLRAbstractNode
	self rvalue notNil
		ifTrue: [ self rvalue parent: nil ].
	rvalue := aCGLRAbstractNode.
	self rvalue notNil
		ifTrue: [ self rvalue parent: self ]