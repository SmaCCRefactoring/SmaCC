generated
type: aCGLRTypeNameNode
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCGLRTypeNameNode.
	self type notNil
		ifTrue: [ self type parent: self ]