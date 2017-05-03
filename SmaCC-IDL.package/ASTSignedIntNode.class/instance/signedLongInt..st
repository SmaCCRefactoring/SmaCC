generated
signedLongInt: anASTSignedLongIntNode
	self signedLongInt notNil
		ifTrue: [ self signedLongInt parent: nil ].
	signedLongInt := anASTSignedLongIntNode.
	self signedLongInt notNil
		ifTrue: [ self signedLongInt parent: self ]