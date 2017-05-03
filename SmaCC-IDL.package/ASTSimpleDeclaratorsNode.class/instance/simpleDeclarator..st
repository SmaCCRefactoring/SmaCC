generated
simpleDeclarator: anASTSimpleDeclaratorNode
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: nil ].
	simpleDeclarator := anASTSimpleDeclaratorNode.
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: self ]