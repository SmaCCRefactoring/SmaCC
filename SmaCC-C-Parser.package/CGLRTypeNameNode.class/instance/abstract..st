generated
abstract: aCGLRAbstractDeclaratorNode
	self abstract notNil
		ifTrue: [ self abstract parent: nil ].
	abstract := aCGLRAbstractDeclaratorNode.
	self abstract notNil
		ifTrue: [ self abstract parent: self ]