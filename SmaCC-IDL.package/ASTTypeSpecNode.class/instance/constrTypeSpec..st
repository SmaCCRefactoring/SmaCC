generated
constrTypeSpec: anASTConstrTypeSpecNode
	self constrTypeSpec notNil
		ifTrue: [ self constrTypeSpec parent: nil ].
	constrTypeSpec := anASTConstrTypeSpecNode.
	self constrTypeSpec notNil
		ifTrue: [ self constrTypeSpec parent: self ]