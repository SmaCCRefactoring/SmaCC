generated
elseStatement: aDelphiStatementNode
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: nil ].
	elseStatement := aDelphiStatementNode.
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: self ]