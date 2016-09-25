generated
trueStatement: aJSStatementNode
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: nil ].
	trueStatement := aJSStatementNode.
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: self ]