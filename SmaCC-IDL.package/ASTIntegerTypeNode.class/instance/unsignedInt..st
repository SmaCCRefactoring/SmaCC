generated
unsignedInt: anASTUnsignedIntNode
	self unsignedInt notNil
		ifTrue: [ self unsignedInt parent: nil ].
	unsignedInt := anASTUnsignedIntNode.
	self unsignedInt notNil
		ifTrue: [ self unsignedInt parent: self ]