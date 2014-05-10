generated
statements: anASTStmtNode
	self statements notNil
		ifTrue: [ self statements parent: nil ].
	statements := anASTStmtNode.
	self statements notNil
		ifTrue: [ self statements parent: self ]