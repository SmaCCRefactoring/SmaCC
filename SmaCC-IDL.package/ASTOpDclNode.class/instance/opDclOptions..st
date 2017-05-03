generated
opDclOptions: anASTOpDclOptionsNode
	self opDclOptions notNil
		ifTrue: [ self opDclOptions parent: nil ].
	opDclOptions := anASTOpDclOptionsNode.
	self opDclOptions notNil
		ifTrue: [ self opDclOptions parent: self ]