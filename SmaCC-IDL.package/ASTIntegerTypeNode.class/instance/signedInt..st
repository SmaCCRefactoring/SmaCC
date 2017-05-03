generated
signedInt: anASTSignedIntNode
	self signedInt notNil
		ifTrue: [ self signedInt parent: nil ].
	signedInt := anASTSignedIntNode.
	self signedInt notNil
		ifTrue: [ self signedInt parent: self ]