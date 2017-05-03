generated
exceptDcl: anASTExceptDclNode
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: nil ].
	exceptDcl := anASTExceptDclNode.
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: self ]