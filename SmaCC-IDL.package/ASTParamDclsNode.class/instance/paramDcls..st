generated
paramDcls: anASTParamDclsNode
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: nil ].
	paramDcls := anASTParamDclsNode.
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: self ]