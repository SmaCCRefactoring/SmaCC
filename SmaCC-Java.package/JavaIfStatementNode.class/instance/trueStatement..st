generated
trueStatement: aJavaStatementNode
	self trueStatement notNil ifTrue: [self trueStatement parent: nil].
	trueStatement := aJavaStatementNode.
	self trueStatement notNil ifTrue: [self trueStatement parent: self]