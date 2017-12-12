generated
body: aCGLRCompoundStatementNode
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCGLRCompoundStatementNode.
	self body notNil
		ifTrue: [ self body parent: self ]