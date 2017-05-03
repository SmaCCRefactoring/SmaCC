generated
booleanType: anASTBooleanTypeNode
	self booleanType notNil
		ifTrue: [ self booleanType parent: nil ].
	booleanType := anASTBooleanTypeNode.
	self booleanType notNil
		ifTrue: [ self booleanType parent: self ]