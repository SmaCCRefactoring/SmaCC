generated
falseStatement: aJavaStatementNode
	self falseStatement notNil
		ifTrue: [ self falseStatement parent: nil ].
	falseStatement := aJavaStatementNode.
	self falseStatement notNil
		ifTrue: [ self falseStatement parent: self ]