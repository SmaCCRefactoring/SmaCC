generated
thenStatement: aCSStatementNode
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: nil ].
	thenStatement := aCSStatementNode.
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: self ]