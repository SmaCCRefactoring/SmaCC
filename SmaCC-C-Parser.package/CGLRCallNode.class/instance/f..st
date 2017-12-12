generated
f: aCGLRAbstractNode
	self f notNil
		ifTrue: [ self f parent: nil ].
	f := aCGLRAbstractNode.
	self f notNil
		ifTrue: [ self f parent: self ]