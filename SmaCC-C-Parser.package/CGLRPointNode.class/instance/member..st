generated
member: aCGLRIdentifierNode
	self member notNil
		ifTrue: [ self member parent: nil ].
	member := aCGLRIdentifierNode.
	self member notNil
		ifTrue: [ self member parent: self ]