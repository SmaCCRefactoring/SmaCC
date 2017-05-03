generated
thenStatement: aDelphiStatementNode
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: nil ].
	thenStatement := aDelphiStatementNode.
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: self ]