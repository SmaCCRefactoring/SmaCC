generated
unsignedLongInt: anASTUnsignedLongIntNode
	self unsignedLongInt notNil
		ifTrue: [ self unsignedLongInt parent: nil ].
	unsignedLongInt := anASTUnsignedLongIntNode.
	self unsignedLongInt notNil
		ifTrue: [ self unsignedLongInt parent: self ]