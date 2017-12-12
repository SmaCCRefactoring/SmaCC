generated
then: aCGLRAbstractNode
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aCGLRAbstractNode.
	self then notNil
		ifTrue: [ self then parent: self ]