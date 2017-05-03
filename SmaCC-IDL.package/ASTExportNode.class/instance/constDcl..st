generated
constDcl: anASTConstDclNode
	self constDcl notNil
		ifTrue: [ self constDcl parent: nil ].
	constDcl := anASTConstDclNode.
	self constDcl notNil
		ifTrue: [ self constDcl parent: self ]