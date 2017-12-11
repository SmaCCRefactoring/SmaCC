generated
condition: aCGLRAbstractNode
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aCGLRAbstractNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]