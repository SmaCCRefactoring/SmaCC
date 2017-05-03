generated
simpleTypeSpec: anASTSimpleTypeSpecNode
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: nil ].
	simpleTypeSpec := anASTSimpleTypeSpecNode.
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: self ]