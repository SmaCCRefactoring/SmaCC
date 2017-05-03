generated
simpleDeclarators: anASTSimpleDeclaratorsNode
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: nil ].
	simpleDeclarators := anASTSimpleDeclaratorsNode.
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: self ]