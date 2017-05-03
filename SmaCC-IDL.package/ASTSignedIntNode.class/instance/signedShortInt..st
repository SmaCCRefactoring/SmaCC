generated
signedShortInt: anASTSignedShortIntNode
	self signedShortInt notNil
		ifTrue: [ self signedShortInt parent: nil ].
	signedShortInt := anASTSignedShortIntNode.
	self signedShortInt notNil
		ifTrue: [ self signedShortInt parent: self ]