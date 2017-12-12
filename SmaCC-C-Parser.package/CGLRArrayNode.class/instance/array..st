generated
array: aCGLRAbstractNode
	self array notNil
		ifTrue: [ self array parent: nil ].
	array := aCGLRAbstractNode.
	self array notNil
		ifTrue: [ self array parent: self ]