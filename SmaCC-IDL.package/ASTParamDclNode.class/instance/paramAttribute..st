generated
paramAttribute: anASTParamAttributeNode
	self paramAttribute notNil
		ifTrue: [ self paramAttribute parent: nil ].
	paramAttribute := anASTParamAttributeNode.
	self paramAttribute notNil
		ifTrue: [ self paramAttribute parent: self ]