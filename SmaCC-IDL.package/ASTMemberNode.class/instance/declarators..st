generated
declarators: anASTDeclaratorsNode
	self declarators notNil
		ifTrue: [ self declarators parent: nil ].
	declarators := anASTDeclaratorsNode.
	self declarators notNil
		ifTrue: [ self declarators parent: self ]