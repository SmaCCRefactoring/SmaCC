generated
finallyBlock: aJSBlockStatementNode
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: nil ].
	finallyBlock := aJSBlockStatementNode.
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: self ]