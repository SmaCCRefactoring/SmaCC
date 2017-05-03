generated
forwardDcl: anASTForwardDclNode
	self forwardDcl notNil
		ifTrue: [ self forwardDcl parent: nil ].
	forwardDcl := anASTForwardDclNode.
	self forwardDcl notNil
		ifTrue: [ self forwardDcl parent: self ]