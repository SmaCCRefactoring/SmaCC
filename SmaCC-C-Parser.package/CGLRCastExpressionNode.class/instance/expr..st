generated
expr: aCGLRAbstractNode
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aCGLRAbstractNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]