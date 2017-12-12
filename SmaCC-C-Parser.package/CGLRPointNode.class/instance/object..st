generated
object: aCGLRAbstractNode
	self object notNil
		ifTrue: [ self object parent: nil ].
	object := aCGLRAbstractNode.
	self object notNil
		ifTrue: [ self object parent: self ]