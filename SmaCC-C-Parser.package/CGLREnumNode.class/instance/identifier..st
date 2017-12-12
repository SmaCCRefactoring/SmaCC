generated
identifier: aCGLRIdentifierNode
	self identifier notNil
		ifTrue: [ self identifier parent: nil ].
	identifier := aCGLRIdentifierNode.
	self identifier notNil
		ifTrue: [ self identifier parent: self ]