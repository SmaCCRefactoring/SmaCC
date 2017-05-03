generated
opAttribute: anASTOpAttributeNode
	self opAttribute notNil
		ifTrue: [ self opAttribute parent: nil ].
	opAttribute := anASTOpAttributeNode.
	self opAttribute notNil
		ifTrue: [ self opAttribute parent: self ]