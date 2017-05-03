generated
declarator: anASTDeclaratorNode
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := anASTDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]