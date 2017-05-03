generated
paramTypeSpec: anASTParamTypeSpecNode
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: nil ].
	paramTypeSpec := anASTParamTypeSpecNode.
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: self ]