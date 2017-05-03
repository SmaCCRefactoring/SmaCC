generated
parameterDcls: anASTParameterDclsNode
	self parameterDcls notNil
		ifTrue: [ self parameterDcls parent: nil ].
	parameterDcls := anASTParameterDclsNode.
	self parameterDcls notNil
		ifTrue: [ self parameterDcls parent: self ]