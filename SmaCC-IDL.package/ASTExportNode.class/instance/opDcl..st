generated
opDcl: anASTOpDclNode
	self opDcl notNil
		ifTrue: [ self opDcl parent: nil ].
	opDcl := anASTOpDclNode.
	self opDcl notNil
		ifTrue: [ self opDcl parent: self ]