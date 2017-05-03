generated
baseTypeSpec: anASTBaseTypeSpecNode
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: nil ].
	baseTypeSpec := anASTBaseTypeSpecNode.
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: self ]