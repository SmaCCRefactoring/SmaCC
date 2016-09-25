generated
catchBlock: aJSBlockStatementNode
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: nil ].
	catchBlock := aJSBlockStatementNode.
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: self ]