generated
opTypeSpec: anASTOpTypeSpecNode
	self opTypeSpec notNil
		ifTrue: [ self opTypeSpec parent: nil ].
	opTypeSpec := anASTOpTypeSpecNode.
	self opTypeSpec notNil
		ifTrue: [ self opTypeSpec parent: self ]