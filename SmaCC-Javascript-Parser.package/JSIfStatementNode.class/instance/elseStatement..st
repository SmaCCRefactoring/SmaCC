generated
elseStatement: aJSStatementNode
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: nil ].
	elseStatement := aJSStatementNode.
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: self ]