generated
constExp: anASTConstExpNode
	self constExp notNil
		ifTrue: [ self constExp parent: nil ].
	constExp := anASTConstExpNode.
	self constExp notNil
		ifTrue: [ self constExp parent: self ]