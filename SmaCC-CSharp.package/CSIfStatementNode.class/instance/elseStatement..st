generated
elseStatement: aCSStatementNode
	self elseStatement notNil ifTrue: [self elseStatement parent: nil].
	elseStatement := aCSStatementNode.
	self elseStatement notNil ifTrue: [self elseStatement parent: self]