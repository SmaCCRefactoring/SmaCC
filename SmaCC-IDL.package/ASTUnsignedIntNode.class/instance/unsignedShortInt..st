generated
unsignedShortInt: anASTUnsignedShortIntNode
	self unsignedShortInt notNil
		ifTrue: [ self unsignedShortInt parent: nil ].
	unsignedShortInt := anASTUnsignedShortIntNode.
	self unsignedShortInt notNil
		ifTrue: [ self unsignedShortInt parent: self ]