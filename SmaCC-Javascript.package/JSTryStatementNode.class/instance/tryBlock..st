generated
tryBlock: aJSBlockStatementNode
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: nil ].
	tryBlock := aJSBlockStatementNode.
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: self ]