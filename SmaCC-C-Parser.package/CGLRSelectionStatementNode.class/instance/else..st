generated
else: aCGLRAbstractNode
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aCGLRAbstractNode.
	self else notNil
		ifTrue: [ self else parent: self ]