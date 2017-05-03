generated
paramDcl: anASTParamDclNode
	self paramDcl notNil
		ifTrue: [ self paramDcl parent: nil ].
	paramDcl := anASTParamDclNode.
	self paramDcl notNil
		ifTrue: [ self paramDcl parent: self ]